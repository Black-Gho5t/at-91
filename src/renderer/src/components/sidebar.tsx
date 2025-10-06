import React, { useEffect } from "react";

export default function Sidebar(): React.JSX.Element {
  useEffect(() => {
    const sidebarToggleBtns: NodeListOf<HTMLButtonElement> = document.querySelectorAll(".sidebar-toggle");
    const sidebar: HTMLElement | null = document.querySelector(".sidebar");
    const searchForm: HTMLFormElement | null = document.querySelector(".search-form");
    const themeToggleBtn: HTMLButtonElement | null = document.querySelector(".theme-toggle");
    const themeIcon: HTMLElement = themeToggleBtn?.querySelector(".theme-icon");

    if (!sidebar || !searchForm || !themeToggleBtn || !themeIcon) return;

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

    // Expandir sidebar al dar click en el buscador
    const handleSearchClick = (): void => {
      if (sidebar.classList.contains("collapsed")) {
        sidebar.classList.remove("collapsed");
        searchForm.querySelector<HTMLInputElement>("input")?.focus();
      }
    };

    searchForm.addEventListener("click", handleSearchClick);

    // Sidebar expandida por defecto en pantallas grandes
    if (window.innerWidth > 768) sidebar.classList.remove("collapsed");

    // Cleanup de event listeners
    return () => {
      themeToggleBtn.removeEventListener("click", handleThemeToggle);
      sidebarToggleBtns.forEach((btn) =>
        btn.removeEventListener("click", handleSidebarToggle)
      );
      searchForm.removeEventListener("click", handleSearchClick);
    };
  }, []);

  return (
    <div className="container">
      {/* <nav className="site-nav">
        <button className="sidebar-toggle">
          <span className="material-symbols-rounded">menu</span>
        </button>
      </nav> */}

      <aside className="sidebar collapsed">
        <div className="sidebar-content">
          <form action="#" className="search-form">
            <span className="material-symbols-rounded">search</span>
            <input type="search" placeholder="Search..." required />
          </form>

          <ul className="menu-list">
            <li className="menu-item">
              <a href="#" className="menu-link active">
                <span className="material-symbols-rounded">dashboard</span>
                <span className="menu-label">Dashboard</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <span className="material-symbols-rounded">insert_chart</span>
                <span className="menu-label">Analytics</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <span className="material-symbols-rounded">notifications</span>
                <span className="menu-label">Notifications</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <span className="material-symbols-rounded">star</span>
                <span className="menu-label">Favourites</span>
              </a>
            </li>
            <li className="menu-item">
              <a href="#" className="menu-link">
                <span className="material-symbols-rounded">storefront</span>
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
                dark_mode
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
        <h1 className="page-title">Dashboard Overview</h1>
        <p className="card">
          Welcome to your dashboard! Use the menu to navigate, toggle the
          sidebar, or switch between light and dark themes to personalize your
          experience.
        </p>

        <h1 className="page-title">Dashboard Overview</h1>
        <p className="card">
          Welcome to your dashboard! Use the menu to navigate, toggle the
          sidebar, or switch between light and dark themes to personalize your
          experience.
        </p>


        <h1 className="page-title">Dashboard Overview</h1>
        <p className="card">
          Welcome to your dashboard! Use the menu to navigate, toggle the
          sidebar, or switch between light and dark themes to personalize your
          experience.
        </p>


        <h1 className="page-title">Dashboard Overview</h1>
        <p className="card">
          Welcome to your dashboard! Use the menu to navigate, toggle the
          sidebar, or switch between light and dark themes to personalize your
          experience.
        </p>


        <h1 className="page-title">Dashboard Overview</h1>
        <p className="card">
          Welcome to your dashboard! Use the menu to navigate, toggle the
          sidebar, or switch between light and dark themes to personalize your
          experience.
        </p>


        <h1 className="page-title">Dashboard Overview</h1>
        <p className="card">
          Welcome to your dashboard! Use the menu to navigate, toggle the
          sidebar, or switch between light and dark themes to personalize your
          experience.
        </p>


        <h1 className="page-title">Dashboard Overview</h1>
        <p className="card">
          Welcome to your dashboard! Use the menu to navigate, toggle the
          sidebar, or switch between light and dark themes to personalize your
          experience.
        </p>


        <h1 className="page-title">Dashboard Overview</h1>
        <p className="card">
          Welcome to your dashboard! Use the menu to navigate, toggle the
          sidebar, or switch between light and dark themes to personalize your
          experience.
        </p>


        <h1 className="page-title">Dashboard Overview</h1>
        <p className="card">
          Welcome to your dashboard! Use the menu to navigate, toggle the
          sidebar, or switch between light and dark themes to personalize your
          experience.
        </p>


      </div>
    </div>
  );
}
