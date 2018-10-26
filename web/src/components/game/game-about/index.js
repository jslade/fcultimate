import React, { Component } from 'react'
import { Link } from 'react-router-dom'

import Content from '../../content'

export default class GameAbout extends Component {
  render() {
    return (
      <div>
        <h3>Details</h3>
        <Content body={this.props.game.description} />
        {this.renderMailingList()}
      </div>
    )
  }

  renderMailingList() {
    const { game } = this.props

    if (!game.notify_address) {
      return <div />
    }

    const subscribeLink = this.renderSubscribeLink()
    const unsubscribeLink = this.renderUnsubscribeLink()

    return (
      <div>
        <h3>Mailing List</h3>
        <a href={`mailto:${game.notify_address}`}>Send a message to the list</a>
        {subscribeLink}
        {unsubscribeLink}
      </div>
    )
  }

  renderSubscribeLink() {
    const { game } = this.props

    if (!game.subscribe_url) {
      return <div />
    }

    return (
      <div>
        <Link to={`/${game.name}/subscribe`}>Subscribe to the list</Link>
      </div>
    )
  }

  renderUnsubscribeLink() {
    const { game } = this.props

    if (!game.unsubscribe_url) {
      return <div />
    }

    return (
      <div>
        <Link to={`/${game.name}/unsubscribe`}>Unsubscribe from the list</Link>
      </div>
    )
  }
}
