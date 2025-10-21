import Icon from '@renderer/assets/icons';
import React from 'react';
import { useNavigate } from 'react-router-dom';

export default function ProfileMenu(): React.JSX.Element {
    const navigate = useNavigate()
  async function handleTestConnection(): Promise<void> {
    try {
      const result = await (window as any).electronAPI.pingDatabase()
      if (result.success) {
        alert('✅ Conexión exitosa\nHora del servidor: ' + result.time)
      } else {
        alert('❌ Error: ' + result.error)
      }
    } catch (err) {
      alert('❌ No se pudo conectar con la base de datos')
      console.error(err)

    }

  }
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
        <button className="button-menu-user">Administrar cuenta</button>
        <button className="button-menu-user">Personalizar perfil</button>
        <button className="button-menu-user" onClick={() => navigate('/login')}>Agregar perfil</button>
        <button className="button-menu-user">Abrir perfil de invitado</button>
        <button className="button-menu-user" onClick={handleTestConnection}>Probar conexion</button>
      </div>
    </div>
  );
}
