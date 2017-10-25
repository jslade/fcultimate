import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'

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
          <Route path='/contact' component={Contact} />
          <Route path='/:name' component={Game} />
        </Switch>
      </PageLayout>
    </Router>
  )
}
