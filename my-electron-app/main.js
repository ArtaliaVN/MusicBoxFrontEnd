const { app, BrowserWindow } = require('electron')
// include the Node.js 'path' module at the top of your file
const path = require('node:path')

// modify your existing createWindow() function
const createWindow = () => {
  const win = new BrowserWindow({
    width: 960,
    height: 640,
    autoHideMenuBar: true,
    webPreferences: {
      preload: path.join("my-electron-app", 'preload.js')
    }
  })

  const appURL = "http://localhost:3306"
  win.loadURL(appURL)
  win.loadFile('Search.html')
}

app.whenReady().then(() => {
    createWindow()

    app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) createWindow()
    })
})

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') app.quit()
})