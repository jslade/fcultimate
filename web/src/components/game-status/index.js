import React, { Component } from 'react'

class GameStatus extends Component {

  playerCount = () => {
    try { return this.props.game.signups.length }
    catch(e) { return 0 }
  }

  gameStatus = () => {
    try { return this.props.game.status }
    catch(e) { return 0 }
  }

  messages = [
    'No game expected today',
    'No one has signed up yet -- be the first!',
    'Not enough players signed up -- call yer buddies!',
    'Game ON!',
    "Game ON! Big ol' game today..."
  ]

  alertClasses = [
    'alert-info',
    'alert-info',
    'alert-warning',
    'alert-success',
    'alert-success'
  ]

  statusMessage = () => {
    try { return this.messages[this.gameStatus()] }
    catch(e) { return 'unknown state' }
  }

  statusAlertClass = () => {
    try { return this.alertClasses[this.gameStatus()] }
    catch(e) { return '' }
  }

  render () {
    return (
      <div className={`alert ${this.statusAlertClass()}`} role="alert">
        <h3 className='alert-heading'>{this.playerCount()}</h3>
        <div className='message'>{this.statusMessage()}</div>
      </div>
    )
  }
}

export default GameStatus
