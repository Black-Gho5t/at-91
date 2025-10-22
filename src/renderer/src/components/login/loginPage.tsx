import React from 'react'
import "../../assets/loginPage.css"

export default function LoginPage(): React.JSX.Element {
  return (
    <div className="container-login">
      <form className="form">
        <p className="form-title">Iniciar sesion</p>
        <div className="input-container">
          <input type="email" placeholder="Email"></input>
          <span>
          </span>
        </div>
        <div className="input-container">
          <input type="password" placeholder="Contraseña"></input>
        </div>
        <button type="submit" className="submit">
          Iniciar
        </button>

        <p className="signup-link">
          No tienes cuenta?
          <a href=""> Crear cuenta</a>
        </p>
      </form>
    </div>
  )
}
