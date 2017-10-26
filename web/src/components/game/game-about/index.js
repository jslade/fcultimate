import React, { Component } from 'react'

import Content from '../../content'

class GameAbout extends Component {
  render () {
    return (
      <div>
        <h3>Details</h3>
        <Content body={this.props.game.description} />
        {this.renderMailingList()}
      </div>
    )
  }

  renderMailingList () {
    const { game } = this.props

    if (!game.notify_address) {
      return (<div />)
    }

    return (
      <div>
        <h3>Mailing List</h3>
        <a href={`mailto:${game.notify_address}`}>Send a message to the list</a>
        <br/>
        <a href={game.subscribe_url}>Subscribe to the list</a>
        <br/>
        <a href={game.unsubscribe_url}>Unsubscribe from the list</a>
      </div>
    )
  }
}

export default GameAbout
