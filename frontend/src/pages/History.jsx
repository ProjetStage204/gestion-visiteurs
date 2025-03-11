import React, { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import AddVisitorModal from "../components/AddVisitorModal";
import logoH from "../photos/logoH.png"; // ✅ Ajout du logo pour le header

const History = () => {
  const [historyData, setHistoryData] = useState([]);
  const [statusFilter, setStatusFilter] = useState("");
  const [startDate, setStartDate] = useState("");
  const [endDate, setEndDate] = useState("");
  const [searchTerm, setSearchTerm] = useState("");
  const [showModal, setShowModal] = useState(false);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

  useEffect(() => {
    fetchHistory();
  }, []);

  const fetchHistory = async () => {
    setLoading(true);
    const token = localStorage.getItem("token");

    if (!token) {
      console.error("Aucun token trouvé, redirection vers connexion.");
      navigate("/login");
      return;
    }

    try {
      const response = await axios.get("http://127.0.0.1:8000/api/visitor-history", {
        headers: { Authorization: `Bearer ${token}` },
        params: {
          status: statusFilter || undefined,
          start_date: startDate || undefined,
          end_date: endDate || undefined,
          search: searchTerm || undefined,
        },
      });

      console.log("Réponse API:", response.data);
      setHistoryData(response.data);
    } catch (error) {
      console.error("Erreur chargement de l'historique :", error);
    } finally {
      setLoading(false);
    }
  };

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("role");
    navigate("/login");
  };

  return (
    <div className="min-h-screen flex flex-col bg-gray-100">
      {/* ✅ Header principal */}
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

      {/* ✅ Mini-Menu */}
      <nav className="bg-blue-900 text-white py-3 px-6 flex space-x-6">
        <span className="cursor-pointer text-lg font-semibold hover:underline hover:text-yellow-400 transition" onClick={() => navigate("/dashboard")}>
          Tableau de Bord
        </span>
        <span 
    onClick={() => setShowModal(true)} 
    className="cursor-pointer text-lg font-semibold hover:underline hover:text-yellow-400 transition"
  >
    Ajouter un Visiteur
  </span>
        <span className="cursor-pointer text-lg font-semibold hover:underline hover:text-yellow-400 transition">
          Historique des Visiteurs
        </span>
      </nav>
{showModal && <AddVisitorModal onClose={() => setShowModal(false)}  />}
      {/* ✅ Contenu principal */}
      <div className="p-6">
        <h1 className="text-3xl font-bold text-blue-900 mb-6">Historique des Visiteurs</h1>

        {/* ✅ Filtres */}
        <div className="bg-white p-4 shadow rounded-lg mb-4 flex flex-wrap items-center space-x-4">
          <select onChange={(e) => setStatusFilter(e.target.value)} className="px-4 py-2 border border-gray-300 rounded-lg">
            <option value="">Tous les statuts</option>
            <option value="En attente">En attente</option>
            <option value="Entré">Entré</option>
            <option value="Sorti">Sorti</option>
          </select>

          <input type="date" onChange={(e) => setStartDate(e.target.value)} className="px-4 py-2 border border-gray-300 rounded-lg" />
          <input type="date" onChange={(e) => setEndDate(e.target.value)} className="px-4 py-2 border border-gray-300 rounded-lg" />

          <input type="text" placeholder="Rechercher par CIN/Nom" onChange={(e) => setSearchTerm(e.target.value)} className="px-4 py-2 border border-gray-300 rounded-lg" />

          <button onClick={fetchHistory} className="bg-blue-900 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
            Rechercher
          </button>
        </div>

        {/* ✅ Affichage des résultats */}
        <div className="bg-white p-6 shadow rounded-lg">
          <h2 className="text-2xl font-semibold mb-4">Résultats</h2>

          {loading ? (
            <p className="text-center text-gray-500">Chargement des données...</p>
          ) : (
            <table className="w-full border-collapse border border-gray-300">
              <thead>
                <tr className="bg-gray-200">
                  <th className="border p-2">Nom</th>
                  <th className="border p-2">CIN</th>
                  <th className="border p-2">Statut</th>
                  <th className="border p-2">Date</th>
                </tr>
              </thead>
              <tbody>
                {historyData.length > 0 ? (
                  historyData.map((visitor) => (
                    <tr key={visitor.id} className="text-center">
                      <td className="border p-2">{visitor.name}</td>
                      <td className="border p-2">{visitor.cin}</td>
                      <td className="border p-2">{visitor.status}</td>
                      <td className="border p-2">{new Date(visitor.updated_at).toLocaleString()}</td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="4" className="border p-2 text-center text-gray-500">Aucun résultat trouvé</td>
                  </tr>
                )}
              </tbody>
            </table>
          )}
        </div>
      </div>
    </div>
  );
};

export default History;
