import React from 'react'
import {
  BrowserRouter as Router,
  Route,
  Redirect,
  Switch
} from 'react-router-dom'

import About from '../components/about'
import Contact from '../components/contact'
import Game from '../components/game'
import Home from '../components/home'
import PageLayout from '../components/page-layout'

export default function router() {
  return (
    <Router>
      <PageLayout>
        <Route exact path="/" component={Home} />
        <Switch>
          <Route exact path="/index.html" component={Home} />
          <Route exact path="/contact" component={Contact} />
          <Route exact path="/about" component={About} />
          <Route path="/:name" component={Game} />

          <Route
            path="/:name/signup"
            render={({ match }) => {
              return <Redirect to={`/${match.params.name}`} />
            }}
          />
        </Switch>
      </PageLayout>
    </Router>
  )
}
