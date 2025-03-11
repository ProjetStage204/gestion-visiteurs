import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { toast } from "react-toastify";
import jsPDF from "jspdf";
import "jspdf/dist/polyfills.es.js"; // ✅ Ajout d'un polyfill pour éviter les erreurs
import autoTable from "jspdf-autotable";
import Papa from "papaparse";
import logoH from "../photos/logoH.png";
import AddVisitorModal from "../components/AddVisitorModal";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from "recharts";

const Dashboard = () => {
  const [visitors, setVisitors] = useState([]);
  const [stats, setStats] = useState({});
  const [search, setSearch] = useState("");
  const [userRole, setUserRole] = useState("");
  const [showModal, setShowModal] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem("token");
    if (!token) {
      navigate("/login");
      return;
    }

    axios.get("http://127.0.0.1:8000/api/auth/user", {
      headers: { Authorization: `Bearer ${token}` },
    })
    .then((response) => setUserRole(response.data.user.role))
    .catch((error) => console.error("Erreur chargement du rôle utilisateur", error));

    axios.get("http://127.0.0.1:8000/api/visitor-stats", {
      headers: { Authorization: `Bearer ${token}` },
    })
    .then((response) => setStats(response.data))
    .catch((error) => console.error("Erreur chargement des stats", error));

    axios.get("http://127.0.0.1:8000/api/visitors", {
      headers: { Authorization: `Bearer ${token}` },
    })
    .then((response) => setVisitors(response.data))
    .catch((error) => console.error("Erreur chargement des visiteurs", error));
  }, [navigate]);

  const fetchStats = async () => {
    const token = localStorage.getItem("token");
    try {
      const response = await axios.get("http://127.0.0.1:8000/api/visitor-stats", {
        headers: { Authorization: `Bearer ${token}` },
      });
  
      console.log("Nouvelles statistiques après suppression :", response.data); // ✅ Vérifier si les stats changent
      setStats(response.data);
    } catch (error) {
      console.error("Erreur chargement des stats", error);
    }
  };
  
  const handleStatusChange = async (id, newStatus) => {
    const token = localStorage.getItem("token");
    try {
      await axios.put(`http://127.0.0.1:8000/api/visitors/${id}/status`, 
        { status: newStatus }, 
        { headers: { Authorization: `Bearer ${token}` } }
      );
  
      setVisitors(visitors.map(v => v.id === id ? { ...v, status: newStatus } : v));
  
      // ✅ Afficher une notification de succès
      toast.success(`Statut mis à jour : ${newStatus}`);
  
    } catch (error) {
      console.error("Erreur mise à jour du statut", error);
      // ❌ Afficher une notification d'erreur
      toast.error("Erreur lors de la mise à jour du statut.");
    }
  };
  

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("role");
    navigate("/login");
  };

  

const handleDelete = async (id) => {
  const token = localStorage.getItem("token");
  if (!token) {
    navigate("/login");
    return;
  }

  if (!window.confirm("Êtes-vous sûr de vouloir supprimer ce visiteur ?")) {
    return;
  }

  try {
    await axios.delete(`http://127.0.0.1:8000/api/visitors/${id}`, {
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
    });

    // ✅ Met à jour la liste des visiteurs après suppression
    setVisitors(prevVisitors => prevVisitors.filter(visitor => visitor.id !== id));

    // ✅ Rafraîchir immédiatement les statistiques après suppression
    await fetchStats();

    // ✅ Afficher une notification de succès
    toast.success("Visiteur supprimé avec succès !");

  } catch (error) {
    console.error("Erreur lors de la suppression", error);
    // ❌ Afficher une notification d'erreur
    toast.error("Erreur lors de la suppression du visiteur.");
  }
};

  

  const filteredVisitors = visitors.filter(visitor =>
    visitor.name.toLowerCase().includes(search.toLowerCase())
  );
  const exportToPDF = () => {
    const doc = new jsPDF();
    doc.text("Liste des Visiteurs", 20, 10);
  
    const tableColumn = ["Nom", "CIN", "Téléphone", "Raison", "Statut"];
    const tableRows = visitors.map((visitor) => [
      visitor.name,
      visitor.cin,
      visitor.phone,
      visitor.reason,
      visitor.status,
    ]);
  
    autoTable(doc, {
      head: [tableColumn], // ✅ Correction : on passe `autoTable(doc, { ... })`
      body: tableRows,
    });
  
    doc.save("visiteurs.pdf");
    toast.success("Exportation PDF réussie !");
  
  };
  
  // ✅ Fonction pour exporter en CSV
  const exportToCSV = () => {
    const csv = Papa.unparse({
      fields: ["Nom", "CIN", "Téléphone", "Raison", "Statut"],
      data: visitors.map((visitor) => [
        visitor.name,
        visitor.cin,
        visitor.phone,
        visitor.reason,
        visitor.status,
      ]),
    });
  
    const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
    const link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.setAttribute("download", "visiteurs.csv");
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  
    toast.success("Exportation CSV réussie !");
  };
  return (
    <div className="min-h-screen flex flex-col bg-gray-100">
        {/* Header */}
        <header className="bg-white text-blue-950 py-6 px-6 flex items-center justify-center shadow-lg relative h-24">
        <img src={logoH} alt="Logo Ministère" className="absolute left-6 h-full w-auto" />
        <h1 className="text-5xl font-bold font-serif tracking-wide">Ministère de la Justice</h1>

        {/* ✅ Bouton Déconnexion */}
        <button 
          onClick={handleLogout}
          className="absolute right-6 bg-red-600 text-white px-5 py-2 rounded-lg shadow hover:bg-red-500 transition"
        >
          Déconnexion
        </button>
      </header>
     {/* Mini-Header (Menu de navigation) */}
<nav className="bg-blue-900 text-white py-3 px-6 flex space-x-8 shadow-md">
<span 
    onClick={() => setShowModal(true)} 
    className="cursor-pointer text-lg font-semibold hover:underline hover:text-yellow-400 transition"
  >
    Ajouter un Visiteur
  </span>

  <span 
    onClick={() => navigate("/dashboard")} 
    className="cursor-pointer text-lg font-semibold hover:underline hover:text-yellow-400 transition"
  >
    Statistiques
  </span>

  {/* Menu déroulant pour Exporter */}
<div className="relative group">
  <span className="cursor-pointer text-lg font-semibold hover:underline hover:text-yellow-400 transition flex items-center">
    Exporter <span className="ml-1 transition-transform group-hover:rotate-180">▼</span>
  </span>
  <div className="absolute left-0 hidden group-hover:block bg-white text-blue-900 py-2 rounded shadow-lg w-36">
    <span 
      onClick={exportToPDF} // ✅ Exporter en PDF
      className="block px-4 py-1 hover:bg-gray-200 cursor-pointer"
    >
      PDF
    </span>
    <span 
      onClick={exportToCSV} // ✅ Exporter en CSV
      className="block px-4 py-1 hover:bg-gray-200 cursor-pointer"
    >
      CSV
    </span>
  </div>
</div>

  <span 
    onClick={() => navigate("/history")} 
    className="cursor-pointer text-lg font-semibold hover:underline hover:text-yellow-400 transition"
  >
    Historique
  </span>
</nav>
{showModal && <AddVisitorModal onClose={() => setShowModal(false)} onVisitorAdded={fetchStats} />}
      <div className="p-6">
      <h1 className="text-3xl font-bold text-blue-900 mb-6">Tableau de Bord - Ministère de la Justice</h1>

      <button
        onClick={() => setShowModal(true)}
        className="mb-4 bg-green-600 text-white px-4 py-2 rounded hover:bg-green-500 transition"
      >
        Ajouter un Visiteur
      </button>

      <input
        type="text"
        placeholder="Rechercher un visiteur..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        className="w-full px-4 py-2 border border-gray-300 rounded-lg mb-4"
      />

      <div className="grid grid-cols-3 gap-4 mb-6">
        <div className="bg-white p-4 shadow rounded-lg">
          <h2 className="text-xl font-semibold">Total Visiteurs</h2>
          <p className="text-2xl">{stats.total_visitors || 0}</p>
        </div>
        <div className="bg-white p-4 shadow rounded-lg">
          <h2 className="text-xl font-semibold">Visites Aujourd'hui</h2>
          <p className="text-2xl">{stats.visits_today || 0}</p>
        </div>
        <div className="bg-white p-4 shadow rounded-lg">
          <h2 className="text-xl font-semibold">Visites ce Mois</h2>
          <p className="text-2xl">{stats.visits_this_month || 0}</p>
        </div>
      </div>

      <ResponsiveContainer width="100%" height={300}>
        <LineChart data={stats.visits_per_month || []}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="month" />
          <YAxis />
          <Tooltip />
          <Line type="monotone" dataKey="visits" stroke="#8884d8" strokeWidth={2} />
        </LineChart>
      </ResponsiveContainer>

      <div className="bg-white p-6 shadow rounded-lg">
        <h2 className="text-2xl font-semibold mb-4">Liste des Visiteurs</h2>
        <table className="w-full border-collapse border border-gray-300">
          <thead>
            <tr className="bg-gray-200">
              <th className="border p-2">Nom</th>
              <th className="border p-2">CIN</th>
              <th className="border p-2">Téléphone</th>
              <th className="border p-2">Raison</th>
              {userRole === "admin" && <th className="border p-2">Actions</th>}
              {userRole === "agent" && <th className="border p-2">status</th>}
            </tr>
          </thead>
          <tbody>
            {filteredVisitors.length > 0 ? (
              filteredVisitors.map((visitor) => (
                <tr key={visitor.id} className="text-center">
                  <td className="border p-2">{visitor.name}</td>
                  <td className="border p-2">{visitor.cin}</td>
                  <td className="border p-2">{visitor.phone}</td>
                  <td className="border p-2">{visitor.reason}</td>
                  {userRole === "admin" && (
                    <td className="border p-2 space-x-2">
                      <button onClick={() => navigate(`/edit-visitor/${visitor.id}`)} className="bg-yellow-500 text-white px-2 py-1 rounded hover:bg-yellow-400 transition">Modifier</button>
                      <button onClick={() => handleDelete(visitor.id)} className="bg-red-600 text-white px-2 py-1 rounded hover:bg-red-500 transition">Supprimer</button>
                    </td>
                  )}
                  {/* Agent peut modifier le statut */}
                  {userRole === "agent" && (
  <td className="border p-2 ">
    {visitor.status === "En attente" && (
      <>
        <button onClick={() => handleStatusChange(visitor.id, "Entré")} 
          className="bg-green-500 text-white px-2 py-1 rounded hover:bg-green-400 transition">
          Entré
        </button>
        <button onClick={() => handleStatusChange(visitor.id, "Sorti")} 
          className="bg-gray-500 text-white px-2 py-1 rounded hover:bg-gray-400 transition ml-2">
          Sorti
        </button>
      </>
    )}

    {visitor.status === "Entré" && (
      <button onClick={() => handleStatusChange(visitor.id, "Sorti")} 
        className="bg-gray-500 text-white px-2 py-1 rounded hover:bg-gray-400 transition">
        Sorti
      </button>
    )}

    {visitor.status === "Sorti" && (
      <button onClick={() => handleStatusChange(visitor.id, "Entré")} 
        className="bg-green-500 text-white px-2 py-1 rounded hover:bg-green-400 transition">
        Entré
      </button>
    )}
  </td>
)}

                </tr>
              ))
            ) : (
              <tr>
                <td colSpan={userRole === "admin" ? "5" : "4"} className="border p-2 text-center text-gray-500">Aucun visiteur trouvé</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
    </div>
  );
};

export default Dashboard;
