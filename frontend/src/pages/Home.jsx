import React from "react";
import { useNavigate } from "react-router-dom";
import logoH from "../photos/logoH.png"; // Assurez-vous que le fichier est bien dans le dossier photos
import logoF from "../photos/logoF.png"; // Assurez-vous que le fichier est bien dans le dossier photos
import lg1 from "../photos/lg1.svg";
import lg2 from "../photos/lg2.svg";
import lg3 from "../photos/lg3.svg";

const Home = () => {
  const navigate = useNavigate();
  const logos = [lg1, lg2, lg3];

  return (
    <div className="min-h-screen flex flex-col bg-white text-gray-900">
      {/* Header */}
      <header className="bg-white text-blue-950 py-6 px-6 flex items-center justify-center shadow-lg relative h-24">
        <img src={logoH} alt="Logo Ministère" className="absolute left-6 h-full w-auto" />
        <h1 className="text-5xl font-bold font-serif tracking-wide">Ministère de la Justice</h1>
        <button 
          onClick={() => navigate("/login")}
          className="absolute right-6 bg-blue-950 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-900 transition"
        >
          Connexion
        </button>
      </header>

      {/* Main Content */}
      <main 
        className="flex-1 flex flex-col items-center justify-center bg-cover bg-center text-center px-4 py-10 w-full relative" 
        style={{ backgroundImage: "url('https://lematin.ma/lematin/uploads/images/2024/07/25/329160.webp')", minHeight: "calc(100vh - 96px)" }}
      >
        <h2 className="text-4xl font-bold text-white mb-4">Bienvenue sur la Plateforme de Gestion des Visiteurs</h2>
        <p className="text-lg text-white max-w-2xl">
          Simplifiez et sécurisez l'accès aux locaux du Ministère de la Justice grâce à notre système de gestion des visiteurs.
        </p>

        {/* Bouton "En savoir plus" en bas à droite */}
        <button 
          onClick={() => window.scrollTo({ top: window.innerHeight, behavior: "smooth" })}
          className="absolute bottom-6 right-6 bg-yellow-600 text-blue-950 font-bold px-5 py-3 rounded-lg shadow-lg hover:bg-yellow-500 transition-all"
        >
          En savoir plus ↓
        </button>
      </main>

      {/* Nouvelle Section 60% Bleu / Blanc */}
      <section className="relative w-full h-[60vh] flex flex-col">
        <div className="h-1/2 bg-blue-950 w-full"></div> {/* Partie haute en bleu */}
        <div className="h-1/2 bg-white w-full"></div> {/* Partie basse en blanc */}

        {/* Conteneur des divs bien centrées */}
        <div className="absolute inset-0 flex items-center justify-center">
          <div className="w-full max-w-5xl grid grid-cols-1 md:grid-cols-3 gap-8">
            {["Sécurité Renforcée", "Suivi en Temps Réel", "Interface Intuitive"].map((title, index) => (
              <div key={index} className="bg-white shadow-lg p-6 rounded-lg text-center group relative overflow-hidden transition-all duration-500 w-full max-w-sm mx-auto">
                <div className="flex flex-col items-center transition-transform duration-500 group-hover:translate-y-[-20px]">
                  <img src={logos[index]} alt={title} className="h-16 mx-auto transition-transform duration-500 group-hover:scale-75" />
                  <div className="h-1 w-12 bg-blue-950 mx-auto my-4 transition-opacity duration-500 group-hover:opacity-0"></div>
                  <h3 className="text-xl font-semibold text-blue-950">{title}</h3>
                </div>
                <p className="text-gray-600 mt-2 opacity-0 transition-opacity duration-500 group-hover:opacity-100">
                  {index === 0 && "Gérez et contrôlez les accès aux bâtiments administratifs."}
                  {index === 1 && "Suivez les entrées et sorties des visiteurs avec précision."}
                  {index === 2 && "Utilisation simplifiée pour un accès rapide aux informations."}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-green-950 text-white py-6 w-full mt-auto">
        <div className="max-w-6xl mx-auto grid grid-cols-3 items-center px-6">
          {/* Texte à gauche */}
          <p className="text-lg font-semibold text-left">© 2025 Ministère de la Justice - Tous droits réservés</p>
          
          {/* Logo centré */}
          <div className="flex justify-center">
            <img src={logoF} alt="Logo Ministère" className="h-25 w-auto" />
          </div>

          {/* Infos à droite */}
          <div className="text-sm text-right">
            <p>Adresse : 6 Rue Beyrouth, Rabat</p>
            <p>Tél : +212 5372-13737</p>
            <p>Email : Mjustice@justice.gov.ma</p>
          </div>
        </div>
      </footer>
    </div>
  );
};

export default Home;
