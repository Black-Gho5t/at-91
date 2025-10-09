import React from 'react'
// import styled from 'styled-components';

const Radio = (): React.JSX.Element => {
  return (

      <div className="menu">
        <a href="#" className="link">
          <span className="link-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width={192} height={192} fill="currentColor" viewBox="0 0 256 256">
              <rect width={256} height={256} fill="none" />
              <path d="M213.3815,109.61945,133.376,36.88436a8,8,0,0,0-10.76339.00036l-79.9945,72.73477A8,8,0,0,0,40,115.53855V208a8,8,0,0,0,8,8H208a8,8,0,0,0,8-8V115.53887A8,8,0,0,0,213.3815,109.61945Z" fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
            </svg>
          </span>
          <span className="link-title">Home</span>
        </a>
        <a href="#" className="link">
          <span className="link-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width={192} height={192} fill="currentColor" viewBox="0 0 256 256">
              <rect width={256} height={256} fill="none" />
              <polyline points="76.201 132.201 152.201 40.201 216 40 215.799 103.799 123.799 179.799" fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
              <line x1={100} y1={156} x2={160} y2={96} fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
              <path d="M82.14214,197.45584,52.201,227.397a8,8,0,0,1-11.31371,0L28.603,215.11268a8,8,0,0,1,0-11.31371l29.94113-29.94112a8,8,0,0,0,0-11.31371L37.65685,141.65685a8,8,0,0,1,0-11.3137l12.6863-12.6863a8,8,0,0,1,11.3137,0l76.6863,76.6863a8,8,0,0,1,0,11.3137l-12.6863,12.6863a8,8,0,0,1-11.3137,0L93.45584,197.45584A8,8,0,0,0,82.14214,197.45584Z" fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
            </svg>
          </span>
          <span className="link-title">Games</span>
        </a>
        <a href="#" className="link">
          <span className="link-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width={192} height={192} fill="currentColor" viewBox="0 0 256 256">
              <rect width={256} height={256} fill="none" />
              <path d="M45.42853,176.99811A95.95978,95.95978,0,1,1,79.00228,210.5717l.00023-.001L45.84594,220.044a8,8,0,0,1-9.89-9.89l9.47331-33.15657Z" fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
              <line x1={96} y1={112} x2={160} y2={112} fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
              <line x1={96} y1={144} x2={160} y2={144} fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
            </svg>
          </span>
          <span className="link-title">Chat</span>
        </a>
        <a href="#" className="link">
          <span className="link-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width={192} height={192} fill="currentColor" viewBox="0 0 256 256">
              <rect width={256} height={256} fill="none" />
              <circle cx={116} cy={116} r={84} fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
              <line x1="175.39356" y1="175.40039" x2="223.99414" y2="224.00098" fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
            </svg>
          </span>
          <span className="link-title">Search</span>
        </a>
        <a href="#" className="link">
          <span className="link-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width={192} height={192} fill="currentColor" viewBox="0 0 256 256">
              <rect width={256} height={256} fill="none" />
              <circle cx={128} cy={96} r={64} fill="none" stroke="currentColor" strokeMiterlimit={10} strokeWidth={16} />
              <path d="M30.989,215.99064a112.03731,112.03731,0,0,1,194.02311.002" fill="none" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth={16} />
            </svg>
          </span>
          <span className="link-title">Profile</span>
        </a>
      </div>

  );
}



export default Radio;
