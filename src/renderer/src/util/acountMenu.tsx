import Icon from '@renderer/assets/icons';
import React from 'react';

export default function ProfileMenu(): React.JSX.Element {
  return (
    <div className="login-main-container">

      <div className="current-user-container">
        <div className="table-user">
          <table>
            <tr>
              <td>
                <Icon name="userFill" className='current-user-perfil' />
              </td>
              <td>
                <h3 className="name-current-user">Yader</h3>
              </td>
            </tr>
          </table>
        </div>
        <div>
          <p className="email-user-table">yader877584@gmail.com</p>
        </div>
      </div>

      <div className="info-account-menu">
        <button className="button-menu-user">
          Administrar cuenta
        </button>
        <button className="button-menu-user">
          Personalizar perfil
        </button>
        <button className="button-menu-user">
          Agregar perfil
        </button>
        <button className="button-menu-user">
          Abrir perfil de invitado
        </button>

      </div>
    </div>
  );
}
