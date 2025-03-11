import React, { useState, useEffect } from "react";
import axios from "axios";
import { toast } from "react-toastify";
import { FaUser, FaIdCard, FaPhone, FaRegClipboard } from "react-icons/fa"; // ✅ Import des icônes

const AddVisitorModal = ({ onClose, onVisitorAdded }) => {
  const [visitor, setVisitor] = useState({ name: "", cin: "", phone: "", reason: "" });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    setTimeout(() => setVisible(true), 50);
  }, []);

  const handleClose = () => {
    setVisible(false);
    setTimeout(() => onClose(), 300);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    const token = localStorage.getItem("token");

    try {
      await axios.post("http://127.0.0.1:8000/api/visitors", visitor, {
        headers: { Authorization: `Bearer ${token}` },
      });

      toast.success("Visiteur ajouté avec succès !");
      onVisitorAdded();
      handleClose();
    } catch (err) {
      setError("Erreur lors de l'ajout du visiteur.");
      toast.error("Une erreur s'est produite, veuillez réessayer.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div 
      className={`fixed inset-0 flex items-center justify-center bg-transparent transition-opacity duration-300 z-50 ${
        visible ? "opacity-100" : "opacity-0"
      }`}
    >
      <div 
        className="absolute inset-0 bg-transparent" 
        onClick={handleClose} 
      ></div>

      <div 
        className={`bg-white p-8 rounded-lg shadow-lg w-96 relative transform transition-all duration-300 z-50 ${
          visible ? "scale-100" : "scale-75"
        }`}
        onClick={(e) => e.stopPropagation()}
      >
        {/* ✅ Bouton Fermer avec Animation */}
        <button className="absolute top-2 right-2 text-gray-600 hover:text-red-500 transition-colors duration-200" onClick={handleClose}>
          ✖
        </button>
        <h2 className="text-2xl font-bold text-blue-900 mb-4 text-center">Ajouter un Visiteur</h2>
        {error && <p className="text-red-500 text-center">{error}</p>}

        {/* ✅ Formulaire avec icônes */}
        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="relative">
            <FaUser className="absolute left-3 top-3 text-gray-400" />
            <input
              type="text"
              placeholder="Nom complet"
              value={visitor.name}
              onChange={(e) => setVisitor({ ...visitor, name: e.target.value })}
              required
              className="w-full pl-10 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
            />
          </div>
          <div className="relative">
            <FaIdCard className="absolute left-3 top-3 text-gray-400" />
            <input
              type="text"
              placeholder="CIN"
              value={visitor.cin}
              onChange={(e) => setVisitor({ ...visitor, cin: e.target.value })}
              required
              className="w-full pl-10 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
            />
          </div>
          <div className="relative">
            <FaPhone className="absolute left-3 top-3 text-gray-400" />
            <input
              type="tel"
              placeholder="Téléphone"
              value={visitor.phone}
              onChange={(e) => setVisitor({ ...visitor, phone: e.target.value })}
              required
              className="w-full pl-10 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
            />
          </div>
          <div className="relative">
            <FaRegClipboard className="absolute left-3 top-3 text-gray-400" />
            <input
              type="text"
              placeholder="Raison de la visite"
              value={visitor.reason}
              onChange={(e) => setVisitor({ ...visitor, reason: e.target.value })}
              required
              className="w-full pl-10 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
            />
          </div>

          {/* ✅ Bouton Ajouter */}
          <button type="submit" className="w-full bg-blue-900 text-white py-2 rounded-lg hover:bg-blue-800 transition">
            {loading ? "Ajout..." : "Ajouter"}
          </button>
        </form>
      </div>
    </div>
  );
};

export default AddVisitorModal;
