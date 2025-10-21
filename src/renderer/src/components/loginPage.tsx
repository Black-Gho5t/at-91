import React from 'react'
import "../assets/loginPage.css"

export default function LoginPage(): React.JSX.Element {
  return (

  <form className="form">
    <p className="form-title">Sign in to your account</p>
    <div className="input-container">
      <input type="email" placeholder="Enter email"></input>
      <span>
      </span>
    </div>
    <div className="input-container">
      <input type="password" placeholder="Enter password"></input>
    </div>
    <button type="submit" className="submit">
      Sign in
    </button>

    <p className="signup-link">
      No account?
      <a href="">Sign up</a>
    </p>
  </form>

  )
}
