import React, { useEffect } from "react";
import Icon from "@renderer/assets/icons";
import Feed from './main-feed';


export default function Sidebar(): React.JSX.Element {
  // tarea de programacion
  // leer el promedio de un alumno
  // e imprimir si paso o no
  // la materia

  useEffect(() => {

    const sidebarToggleBtns: NodeListOf<HTMLButtonElement> = document.querySelectorAll(".sidebar-toggle");
    const sidebar: HTMLElement | null = document.querySelector(".sidebar");
    const themeToggleBtn: HTMLButtonElement | null = document.querySelector(".theme-toggle");
    //const themeIcon: HTMLElement = themeToggleBtn?.querySelector(".theme-icon");
    const themeIcon: HTMLElement | null = document.querySelector(".theme-icon")

    if (!sidebar || !themeToggleBtn || !themeIcon) return

    // Actualiza el ícono de tema
    const updateThemeIcon = (): void => {
      const isDark: boolean = document.body.classList.contains("dark-theme");
      themeIcon.textContent = sidebar.classList.contains("collapsed")
        ? isDark
          ? "light_mode"
          : "dark_mode"
        : "dark_mode";
    }

    // Tema guardado o preferencia del sistema
    const savedTheme: string | null = localStorage.getItem("theme");
    const systemPrefersDark: boolean = window.matchMedia(
      "(prefers-color-scheme: dark)"
    ).matches;
    const shouldUseDarkTheme: boolean =
      savedTheme === "dark" || (!savedTheme && systemPrefersDark);

    document.body.classList.toggle("dark-theme", shouldUseDarkTheme);
    updateThemeIcon();

    // Toggle entre temas
    const handleThemeToggle = (): void => {
      const isDark: boolean = document.body.classList.toggle("dark-theme");
      localStorage.setItem("theme", isDark ? "dark" : "light");
      updateThemeIcon()
    }

    themeToggleBtn.addEventListener("click", handleThemeToggle);

    // Toggle sidebar colapsada
    const handleSidebarToggle = (): void => {
      sidebar.classList.toggle("collapsed");
      updateThemeIcon();
    };

    sidebarToggleBtns.forEach((btn) =>
      btn.addEventListener("click", handleSidebarToggle)
    );

    // Sidebar expandida por defecto en pantallas grandes
    if (window.innerWidth > 768) sidebar.classList.remove("collapsed");

    // Cleanup de event listeners
    return () => {
      themeToggleBtn.removeEventListener("click", handleThemeToggle);
      sidebarToggleBtns.forEach((btn) =>
        btn.removeEventListener("click", handleSidebarToggle)
      );
    };
  }, []);

  return (
    <div className="container">
      <aside className="sidebar collapsed">
        <div className="sidebar-content">
          <ul className="menu-list">
            <li className="menu-item">
              <a href="#" className="menu-link active">
                <Icon name="heard" />
                <span className="menu-label">Dashboard</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <Icon name="liston" />
                <span className="menu-label">Analytics</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <Icon name="institud" />
                <span className="menu-label">Notifications</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <Icon name="dashboard" />
                <span className="menu-label">Favourites</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <Icon name="filter" />
                <span className="menu-label">Products</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <span className="material-symbols-rounded">group</span>
                <span className="menu-label">Customers</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <span className="material-symbols-rounded">settings</span>
                <span className="menu-label">Settings</span>
              </a>
            </li>
          </ul>
        </div>

        <div className="sidebar-footer">
          <button className="theme-toggle">
            <div className="theme-label">
              <span className="theme-icon material-symbols-rounded">
                <Icon name="moon" className="theme-icon material-symbols-rounded" />
              </span>
              <span className="theme-text">Dark Mode</span>
            </div>
            <div className="theme-toggle-track">
              <div className="theme-toggle-indicator"></div>
            </div>
          </button>
        </div>
      </aside>

      <div className="main-content">
        <Feed/>
      </div>
    </div>
  );
}
