import React from 'react'
import Icon from '../assets/icons'
import '../assets/feed.css'

export default function Feed(): React.JSX.Element {
  return (
    <div className="card-post">
      <div className="header-card">
        <div className="display-user">
          <div className="perfil-image">
            <Icon name="userFill" />
          </div>
          <div className="name-acount">
            <span>UPB</span>
          </div>
        </div>
        <div className="display-options">
          {/* <button className='feed'>
            <div className="options">
              <Icon name="pointsV" />
            </div>
          </button>
          <button className='feed'>
            <div className="equis">
              <Icon name="equis" />
            </div>
          </button> */}
        </div>
      </div>
      <div className="text-post">Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, autem sint nostrum explicabo nobis quod consequuntur voluptas, iure maiores omnis temporibus quo deleniti nemo natus. Fugiat ea iure eligendi earum?</div>
      <div className="media-post"></div>
    </div>
  )
}
