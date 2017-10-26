import React, { Component } from 'react'

import Content from '../content'

class GameAbout extends Component {
  render () {
    return (
      <div className="App-game-about">
        <Content body={this.props.game.description} />
      </div>
    )
  }
}

export default GameAbout
