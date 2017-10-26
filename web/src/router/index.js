import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'

import About from '../components/about'
import Contact from '../components/contact'
import Game from '../components/game'
import Home from '../components/home'
import PageLayout from '../components/page-layout'

export default function router () {
  return (
    <Router>
      <PageLayout>
        <Route exact path='/' component={Home} />
        <Switch>
          <Route path='/contact' main={Contact} />
          <Route path='/about' component={About} />
          <Route path='/:name' component={Game} />
        </Switch>
      </PageLayout>
    </Router>
  )
}
