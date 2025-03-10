import React from "react";
import { Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import AddVisitor from "./pages/AddVisitor";
import EditVisitor from "./pages/EditVisitor";

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/login" element={<Login />} />
      <Route path="/dashboard" element={<Dashboard />} />
      <Route path="/add-visitor" element={<AddVisitor />} />
      <Route path="/edit-visitor/:id" element={<EditVisitor />} />
    </Routes>
  );
};

export default App;
