import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import axios from "axios";

const EditVisitor = () => {
  const { id } = useParams();
  const [visitor, setVisitor] = useState({ name: "", cin: "", phone: "", reason: "" });
  const [message, setMessage] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem("token");
    if (!token) {
      navigate("/login");
      return;
    }

    axios.get(`http://127.0.0.1:8000/api/visitors/${id}`, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .then((response) => setVisitor(response.data))
    .catch((error) => console.error("Erreur chargement du visiteur", error));
  }, [id, navigate]);

  const handleUpdate = async (e) => {
    e.preventDefault();
    const token = localStorage.getItem("token");

    try {
      await axios.put(`http://127.0.0.1:8000/api/visitors/${id}`, visitor, {
        headers: { Authorization: `Bearer ${token}`, "Content-Type": "application/json" },
      });
      setMessage("Visiteur mis à jour avec succès !");
      setTimeout(() => navigate("/dashboard"), 2000);
    } catch (error) {
      console.error("Erreur mise à jour visiteur", error);
      setMessage("Erreur lors de la mise à jour du visiteur.");
    }
  };

  return (
    <div className="min-h-screen flex justify-center items-center bg-gray-100 p-6">
      <div className="bg-white p-8 rounded-lg shadow-lg w-96">
        <h2 className="text-2xl font-bold text-center text-blue-900 mb-6">Modifier le Visiteur</h2>
        {message && <p className="text-center text-green-500">{message}</p>}
        <form onSubmit={handleUpdate} className="space-y-4">
          <input
            type="text"
            placeholder="Nom complet"
            value={visitor.name}
            onChange={(e) => setVisitor({ ...visitor, name: e.target.value })}
            required
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
          />
          <input
            type="text"
            placeholder="CIN"
            value={visitor.cin}
            onChange={(e) => setVisitor({ ...visitor, cin: e.target.value })}
            required
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
          />
          <input
            type="tel"
            placeholder="Téléphone"
            value={visitor.phone}
            onChange={(e) => setVisitor({ ...visitor, phone: e.target.value })}
            required
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
          />
          <input
            type="text"
            placeholder="Raison de la visite"
            value={visitor.reason}
            onChange={(e) => setVisitor({ ...visitor, reason: e.target.value })}
            required
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
          />
          <button
            type="submit"
            className="w-full bg-blue-900 text-white py-2 rounded-lg hover:bg-blue-800 transition"
          >
            Mettre à Jour
          </button>
        </form>
      </div>
    </div>
  );
};

export default EditVisitor;
