import React, { Component } from 'react'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'

import './App.css'

import About from './components/about'
import Contact from './components/contact'
import Game from './components/game'
import Home from './components/home'
import PageLayout from './components/page-layout'

export default class App extends Component {
  render() {
    return (
      <Router className="App">
        <PageLayout>
          <Route exact path='/' component={Home} />
          <Switch>
            <Route exact path='/contact' component={Contact} />
            <Route exact path='/about' component={About} />
            <Route path='/:name' component={Game} />
          </Switch>
        </PageLayout>
      </Router>
    )
  }
}
