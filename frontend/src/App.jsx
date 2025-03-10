import { Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import AddVisitor from "./pages/AddVisitor";
import EditVisitor from "./pages/EditVisitor";
import ProtectedRoute from "./components/ProtectedRoute"; // ✅ Import du composant de protection

const App = () => {
  return (
    <Routes>
      {/* Routes publiques */}
      <Route path="/" element={<Home />} />
      <Route path="/login" element={<Login />} />

      {/* Routes protégées pour Admins & Agents */}
      <Route element={<ProtectedRoute allowedRoles={["admin", "agent"]} />}>
        <Route path="/dashboard" element={<Dashboard />} /> {/* ✅ Admin + Agent ont accès */}
      </Route>

      {/* Route protégée uniquement pour les Admins */}
      <Route element={<ProtectedRoute allowedRoles={["admin"]} />}>
        <Route path="/edit-visitor/:id" element={<EditVisitor />} />
      </Route>

      {/* Routes protégées pour Admins & Agents */}
      <Route element={<ProtectedRoute allowedRoles={["admin", "agent"]} />}>
        <Route path="/add-visitor" element={<AddVisitor />} />
      </Route>
    </Routes>
  );
};

export default App;
