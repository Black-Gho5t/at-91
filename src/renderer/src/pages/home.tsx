// src/pages/Home.tsx
import React from "react";
import Header from "../components/header";
import Sidebar from "@renderer/components/sidebar";

export default function Home(): React.JSX.Element {
  return (
    <div className="container-global">
      <Header />
      <Sidebar/>
    </div>
  )
}
