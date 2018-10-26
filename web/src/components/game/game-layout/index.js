import React, { Component } from 'react'

import MainLayout from '../../main-layout'
import GameAbout from '../game-about'
import GameStatus from '../game-status'
import SignupForm from '../signup-form'
import SignupTable from '../signup-table'

export default class GameLayout extends Component {
  render() {
    const { game } = this.props

    return (
      <MainLayout sidebar={<GameAbout game={game} />}>
        <h1>{game.brief}</h1>
        <GameStatus game={game} />
        <h2>Jump into the game</h2>
        <SignupForm game={game} onSubmit={this.props.onSubmit} />
        <SignupTable
          game={game}
          onUpdate={this.props.onUpdate}
          onRemove={this.props.onRemove}
        />
      </MainLayout>
    )
  }
}
