import { useState } from 'react'
import Icon from '../assets/icons'
import ProfileMenu from '@renderer/util/acountMenu'

export default function Header(): React.JSX.Element {
  const [showMenu, setShowMenu] = useState(false)

  const toggleMenu = (): void => setShowMenu((prev) => !prev)

  return (
    <header className="header">
      {/* option botton */}
      <div className="home">
        <button className="button-global-header sidebar-toggle">
          <div className="righleft">
            {/* llamada de funcion para los iconos */}
            <Icon name="options" />
          </div>
        </button>
      </div>
      {/* home botton */}
      <div className="home">
        <button className="button-global-header">
          <div className="righleft">
            <Icon name="home" />
          </div>
        </button>
      </div>
      {/* search input */}
      <div className="input-search-globla">
        <svg className="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
        <input placeholder="Search" type="search" className="input" />
      </div>
      {/* sesion options button */}
      <div className="sesion">
        <button className="button-global-header" onClick={toggleMenu}>
          <div className="righleft">
            <Icon name="sesion" />
          </div>
        </button>
        {showMenu && <ProfileMenu />}
      </div>
    </header>
  )
}
