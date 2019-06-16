import React, { Component } from 'react'
import {
  BrowserRouter as Router,
  Link,
  Route,
  Redirect,
  Switch
} from 'react-router-dom'

import GameLayout from './game-layout'
import GameSubscribe from './subscription'
import GameUnsubscribe from './unsubscription'

import API from '../../services/api'

const REFRESH_INTERVAL = 10 * 60 * 1000

export default class Game extends Component {
  constructor() {
    super()
    this.state = {
      api: new API(),
      loaded: false,
      game: {}
    }
  }

  componentDidMount() {
    this.loadGame()
  }

  componentWillUnmount() {
    clearInterval(this.interval)
  }

  resetRefresh = () => {
    clearInterval(this.interval)
    this.interval = setInterval(() => this.onRefresh(), REFRESH_INTERVAL)
  }

  onRefresh = () => {
    this.loadGame()
  }

  loadGame = () => {
    const { match } = this.props
    this.state.api
      .GET({ path: `games/${match.params.name}` })
      .then(json => this.handleResponse(json))
  }

  handleResponse = json => {
    this.setState({ loaded: true, game: json })
    this.resetRefresh()
  }

  onSubmit = signup => {
    this.state.api
      .POST({
        path: `games/${this.state.game.id}/signups`,
        body: signup
      })
      .then(json => this.handleResponse(json))
  }

  onUpdate = signup => {
    this.state.api
      .PUT({
        path: `games/${this.state.game.id}/signups/${signup.id}`,
        body: signup
      })
      .then(json => this.handleResponse(json))
  }

  onRemove = signup => {
    this.state.api
      .DELETE({
        path: `games/${this.state.game.id}/signups/${signup.id}`
      })
      .then(this.loadGame)
  }

  onSubscribe = subscribe => {
    this.state.api
      .POST({
        path: `games/${this.state.game.id}/subscriptions`,
        body: subscribe
      })
      .then(this.loadGame)
  }

  render() {
    if (!this.state.loaded) {
      return <div className="loader" />
    }

    const { game } = this.state
    if (!game) {
      return this.renderNoGame()
    } else {
      return this.renderGame(game)
    }
  }

  renderGame(game) {
    const gameProps = {
      game: game,
      onSubmit: this.onSubmit,
      onUpdate: this.onUpdate,
      onRemove: this.onRemove,
      onSubscribe: this.onSubscribe
    }

    return (
      <Router>
        <Switch>
          <Route
            exact
            path="/:name"
            render={props => <GameLayout {...gameProps} {...props} />}
          />
          <Route
            path="/:name/subscribe"
            render={props => <GameSubscribe {...gameProps} {...props} />}
          />
          <Route
            path="/:name/unsubscribe"
            render={props => <GameUnsubscribe {...gameProps} {...props} />}
          />

          <Route
            path="/:name"
            render={({ match }) => {
              return <Redirect to={`/${match.params.name}`} />
            }}
          />
        </Switch>
      </Router>
    )
  }

  renderNoGame = () => {
    const { match } = this.props

    return (
      <div className="alert alert-danger">
        <h1 className="alert-heading">Game not found</h1>
        <p>
          Something went wrong... no game named '<code>
            {match.params.name}
          </code>' ?!?
        </p>
        <p>
          <Link to="/contact">Contact</Link> the administrators if you believe
          this is an error.
        </p>
      </div>
    )
  }
}
