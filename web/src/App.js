import { Component } from 'react'
import './App.css'

import router from './router'

class App extends Component {
  render() {
    return router()
  }
}

export default App
