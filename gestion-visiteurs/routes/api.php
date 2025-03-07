<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\User;
use App\Models\Visitor;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Http\Middleware\AdminMiddleware; // Import the Admin Middleware

// 📌 Authentification Routes (Public)
Route::prefix('auth')->group(function () {
    // Inscription (User Registration)
    Route::post('/register', function (Request $request) {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
            'role' => 'in:admin,agent', // Only allow valid roles
        ]);

        // Default role is 'agent' if none is provided
        $role = $request->role ?? 'agent';

        // Create user
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $role,
        ]);

        return response()->json([
            'message' => 'Utilisateur créé avec succès',
            'token' => $user->createToken('auth_token')->plainTextToken
        ], 201);
    });

    // Connexion (User Login)
    Route::post('/login', function (Request $request) {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'message' => 'Les identifiants sont incorrects.',
            ], 401);
        }

        return response()->json([
            'message' => 'Connexion réussie',
            'token' => $user->createToken('auth_token')->plainTextToken
        ]);
    });

    // Déconnexion (User Logout)
    Route::middleware('auth:sanctum')->post('/logout', function (Request $request) {
        $request->user()->tokens()->delete();
        return response()->json(['message' => 'Déconnexion réussie']);
    });

    // Récupérer l'utilisateur authentifié
    Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
        return response()->json([
            'message' => 'Utilisateur Authentifié',
            'user' => $request->user(),
        ]);
    });
});

// 📌 Admin Routes (Restricted)
Route::middleware(['auth:sanctum', 'admin'])->prefix('admin')->group(function () {
    // Admin Dashboard
    Route::get('/dashboard', function () {
        return response()->json(['message' => 'Bienvenue dans le tableau de bord admin']);
    });

    // Liste des utilisateurs (admin only)
    Route::get('/users', function () {
        return response()->json(User::all());
    });

    // Supprimer un utilisateur (admin only)
    Route::delete('/users/{id}', function ($id, Request $request) {
        $user = User::find($id);

        if (!$user) {
            return response()->json(['message' => 'Utilisateur non trouvé'], 404);
        }

        // Prevent deleting the current admin user
        if ($user->id === $request->user()->id) {
            return response()->json(['message' => 'Vous ne pouvez pas supprimer votre propre compte'], 403);
        }

        $user->delete();
        return response()->json(['message' => 'Utilisateur supprimé avec succès']);
    });
});

// 📌 Visitor Management (CRUD) Routes
Route::middleware('auth:sanctum')->group(function () {
    // ✅ Create a visitor
    Route::post('/visitors', function (Request $request) {
        $request->validate([
            'name' => 'required|string',
            'cin' => 'required|string|unique:visitors,cin',
            'phone' => 'required|string',
            'reason' => 'required|string',
        ]);

        $visitor = Visitor::create([
            'name' => $request->name,
            'cin' => $request->cin,
            'phone' => $request->phone,
            'reason' => $request->reason,
            'user_id' => $request->user()->id,
        ]);

        return response()->json(['message' => 'Visiteur ajouté avec succès', 'visitor' => $visitor], 201);
    });

    // ✅ Get all visitors (Admin only)
    Route::middleware('admin')->get('/visitors', function () {
        return response()->json(Visitor::all());
    });

    // ✅ Get a single visitor
    Route::get('/visitors/{id}', function ($id) {
        $visitor = Visitor::find($id);
        if (!$visitor) {
            return response()->json(['message' => 'Visiteur non trouvé'], 404);
        }
        return response()->json($visitor);
    });

    // ✅ Update a visitor
    Route::put('/visitors/{id}', function (Request $request, $id) {
        $visitor = Visitor::find($id);
        if (!$visitor) {
            return response()->json(['message' => 'Visiteur non trouvé'], 404);
        }

        $request->validate([
            'name' => 'string',
            'cin' => 'string|unique:visitors,cin,' . $visitor->id,
            'phone' => 'string',
            'reason' => 'string',
        ]);

        $visitor->update($request->only(['name', 'cin', 'phone', 'reason']));
        return response()->json(['message' => 'Visiteur mis à jour avec succès', 'visitor' => $visitor]);
    });

    // ✅ Delete a visitor (Admin only)
    Route::middleware('admin')->delete('/visitors/{id}', function ($id) {
        $visitor = Visitor::find($id);
        if (!$visitor) {
            return response()->json(['message' => 'Visiteur non trouvé'], 404);
        }
        $visitor->delete();
        return response()->json(['message' => 'Visiteur supprimé avec succès']);
    });
});

// 📌 Public Routes (Accessible without auth)
Route::get('/public-info', function () {
    return response()->json(['message' => 'Informations accessibles publiquement']);
});

Route::middleware(['auth:sanctum', 'admin'])->get('/admin/visitor-stats', function () {
    return response()->json([
        'total_visitors' => \App\Models\Visitor::count(),
        'visits_today' => \App\Models\Visitor::whereDate('created_at', now())->count(),
        'visits_this_month' => \App\Models\Visitor::whereMonth('created_at', now()->month)->count(),
        'most_frequent_visitors' => \App\Models\Visitor::select('name', 'cin', \DB::raw('COUNT(*) as visit_count'))
            ->groupBy('name', 'cin')
            ->orderByDesc('visit_count')
            ->limit(5)
            ->get(),
        'visits_per_agent' => \App\Models\User::where('role', 'agent')
            ->withCount('visitors') // ✅ Now this will work
            ->get(['name', 'visitors_count']),
    ]);
});



Route::middleware(['auth:sanctum', 'admin'])->get('/admin/export-visitors', function () {
    $visitors = \App\Models\Visitor::all();

    $csv = "Name,CIN,Phone,Reason,Date Created\n";
    foreach ($visitors as $visitor) {
        $csv .= "{$visitor->name},{$visitor->cin},{$visitor->phone},{$visitor->reason},{$visitor->created_at}\n";
    }

    return response($csv, 200, [
        'Content-Type' => 'text/csv',
        'Content-Disposition' => 'attachment; filename="visitors.csv"',
    ]);
});
