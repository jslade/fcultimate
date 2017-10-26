import React, { Component } from 'react'
import { Link } from 'react-router-dom'

import GameAbout from '../game-about'
import GameStatus from '../game-status'
import SignupForm from '../signup-form'
import SignupTable from '../signup-table'

import API from '../../services/api'

class Game extends Component {
  constructor () {
    super()
    this.api = new API()
    this.state = {
      loaded: false,
      game: {}
    }
  }

  componentDidMount () {
    this.loadGame()
  }

  loadGame = () => {
    const { match } = this.props
    this.api.GET({ path: `games/${match.params.name}` })
      .then(json => this.handleResponse(json))
  }

  handleResponse = (json) => {
    this.setState({ loaded: true, game: json })
  }

  onSubmit = (signup) => {
    this.api.POST({
      path: `signups`,
      body: Object.assign({
        game_id: this.state.game.id
      }, signup)
    }).then(json => this.handleResponse(json))
  }

  onUpdate = (signup) => {
    this.api.PUT({
      path: `signups/${signup.id}`,
      body: Object.assign({
        game_id: this.state.game.id
      }, signup)
    }).then(json => this.handleResponse(json))
  }

  onRemove = (signup) => {
    this.api.DELETE({
      path: `signups/${signup.id}`,
      query: { game_id: this.state.game.id }
    }).then(this.loadGame)
  }

  render () {
    if (!this.state.loaded) {
      return (
        <div className='loader' />
      )
    }

    const { game } = this.state
    if (!game) {
      return this.renderNoGame()
    }

    return (
      <div>
        <h1>{game.brief}</h1>
        <GameStatus game={game} />
        <SignupTable game={game}
                     onUpdate={this.onUpdate} onRemove={this.onRemove} />
        <h2>Jump into the game</h2>
        <SignupForm game={game}
                    onSubmit={this.onSubmit} />
        <h2>Details</h2>
        <GameAbout game={game} />
      </div>
    )
  }

  renderNoGame = () => {
    const { match } = this.props

    return (
      <div className='alert alert-danger'>
        <h1 className='alert-heading'>Game not found</h1>
        <p>Something went wrong... no game named '<code>{match.params.name}</code>' ?!?</p>
        <p><Link to="/contact">Contact</Link> the administrators if you believe this is an error.</p>
      </div>
    )
  }
}

export default Game
