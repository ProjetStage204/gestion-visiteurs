import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const AddVisitor = () => {
  const [name, setName] = useState("");
  const [cin, setCin] = useState("");
  const [phone, setPhone] = useState("");
  const [reason, setReason] = useState("");
  const [message, setMessage] = useState("");
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    const token = localStorage.getItem("token");
    
    if (!token) {
      navigate("/login");
      return;
    }

    try {
      const response = await axios.post(
        "http://127.0.0.1:8000/api/visitors", // ✅ Correction de l'URL
        { name, cin, phone, reason },
        { headers: { Authorization: `Bearer ${token}`, "Content-Type": "application/json" } }
      );
      setMessage("Visiteur ajouté avec succès !");
      setName("");
      setCin("");
      setPhone("");
      setReason("");
    } catch (error) {
      console.error("Erreur lors de l'ajout du visiteur", error.response ? error.response.data : error);
      setMessage("Erreur lors de l'ajout du visiteur.");
    }
  };

  return (
    <div className="min-h-screen flex justify-center items-center bg-gray-100 p-6">
      <div className="bg-white p-8 rounded-lg shadow-lg w-96">
        <h2 className="text-2xl font-bold text-center text-blue-900 mb-6">
          Ajouter un Visiteur
        </h2>
        {message && <p className="text-center text-green-500">{message}</p>}
        <form onSubmit={handleSubmit} className="space-y-4">
          <input
            type="text"
            placeholder="Nom complet"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
          />
          <input
            type="text"
            placeholder="CIN"
            value={cin}
            onChange={(e) => setCin(e.target.value)}
            required
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
          />
          <input
            type="tel"
            placeholder="Téléphone"
            value={phone}
            onChange={(e) => setPhone(e.target.value)}
            required
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
          />
          <input
            type="text"
            placeholder="Raison de la visite"
            value={reason}
            onChange={(e) => setReason(e.target.value)}
            required
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
          />
          <button
            type="submit"
            className="w-full bg-blue-900 text-white py-2 rounded-lg hover:bg-blue-800 transition"
          >
            Ajouter le Visiteur
          </button>
        </form>
      </div>
    </div>
  );
};

export default AddVisitor;