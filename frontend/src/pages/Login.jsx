import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import logoH from "../photos/logoH.png";
import bgL from "../photos/bgL.jpeg";
import { IoHomeOutline } from "react-icons/io5";
import { IoHome } from "react-icons/io5";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();
  const [hovered, setHovered] = useState(false);

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post("http://127.0.0.1:8000/api/auth/login", {
        email,
        password,
      });
  
      // ✅ Vérifier si le backend renvoie bien le rôle
      if (!response.data.user || !response.data.user.role) {
        throw new Error("Le rôle de l'utilisateur est introuvable !");
      }
  
      localStorage.setItem("token", response.data.token);
      localStorage.setItem("role", response.data.user.role); // ✅ On stocke bien le rôle
  
      // ✅ Redirection forcée vers le Dashboard après une courte attente
      setTimeout(() => {
        navigate("/dashboard");
      }, 100);
    } catch (err) {
      console.error("Erreur de connexion :", err);
      setError("Email ou mot de passe incorrect.");
    }
  };
  
  
  return (
    <div className="flex flex-col min-h-screen bg-gray-100">
      {/* Header */}
      <header className="bg-white text-blue-950 py-6 px-6 flex items-center justify-center shadow-lg relative h-24">
        <img src={logoH} alt="Logo Ministère" className="absolute left-6 h-full w-auto" />
        <h1 className="text-5xl font-bold font-serif tracking-wide">Ministère de la Justice</h1>
        <button 
          onClick={() => navigate("/")}
          onMouseEnter={() => setHovered(true)}
          onMouseLeave={() => setHovered(false)}
          className="absolute right-15 text-blue-950 text-4xl transition-all duration-300"
        >
          {hovered ? <IoHome /> : <IoHomeOutline  />}
        </button>
      </header>

      {/* Main Content - Centering Login Form */}
      <main className="flex-grow flex justify-center items-center bg-cover bg-center text-center px-4 py-10 w-full relative"   style={{ backgroundImage: `url(${bgL})` }} >

        {/* Formulaire de connexion mat transparent */}
        <div className="relative bg-white/15 backdrop-blur-lg p-20 rounded-lg shadow-lg w-full max-w-md">
          <h2 className="text-2xl font-bold text-center text-blue-950 mb-6">Connexion</h2>
          {error && <p className="text-red-500 text-center">{error}</p>}
          <form onSubmit={handleLogin} className="space-y-6">
            <input
              type="email"
              placeholder="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-900 bg-white/70"
            />
            <input
              type="password"
              placeholder="Mot de passe"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-900 bg-white/70"
            />
            <button type="submit" className="w-full bg-blue-950 text-white font-bold py-3 rounded-lg hover:bg-blue-800 transition">
              Se Connecter
            </button>
          </form>
        </div>
      </main>

      {/* Footer */}
     
    </div>
  );
};

export default Login;
