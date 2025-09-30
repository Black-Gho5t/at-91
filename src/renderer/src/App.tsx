// import Versions from './components/Versions'
// import electronLogo from './assets/electron.svg'

function App(): React.JSX.Element {
  //const ipcHandle = (): void => window.electron.ipcRenderer.send('ping')

  return (
    <header>
      <div className="home">
        <button></button>
      </div>
      <div className="righleft">

          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-house-door" viewBox="0 0 16 16">
  <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4z"/>
</svg>

        <button></button>
      </div>
      <div className="serch">
        <form action="" method="get">
          <input type="search" name="main" id="main-search" placeholder="Buscar"/>
        </form>
      </div>
      <div className="sesion">
        <div className="name">iniciar sesio</div>
        <div className="perfil-icon">foto</div>
      </div>

    </header>
  )
}

export default App
