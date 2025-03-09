import { Routes, Route, Navigate } from "react-router-dom";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import AddVisitor from "./pages/AddVisitor";
import EditVisitor from "./pages/EditVisitor"

function App() {
  const token = localStorage.getItem("token"); // Vérifie si l'utilisateur est connecté

  return (
    <Routes>
      <Route path="/" element={<Navigate to="/login" />} />
      <Route path="/login" element={<Login />} />
      <Route path="/dashboard" element={token ? <Dashboard /> : <Navigate to="/login" />} />
      <Route path="/add-visitor" element={token ? <AddVisitor /> : <Navigate to="/login" />} />
      <Route path="/edit-visitor/:id" element={<EditVisitor />} />

    </Routes>
  );
}

export default App;
