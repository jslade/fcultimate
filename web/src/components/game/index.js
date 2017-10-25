import React, { Component } from 'react'

import Content from '../content'

class Game extends Component {
  constructor () {
    super()
    this.state = {
      name: '',
      description: ''
     }
  }

  componentDidMount () {
    const { match } = this.props

    window.fetch(`/api/games/${match.params.name}`)
      .then(response => response.json())
      .then(json => this.handleResponse(json))
      .catch(error => console.log(error))
  }

  handleResponse = (json) => {
    this.setState(json)
  }

  render () {
    return (
      <div>
        <h1>{this.state.brief}</h1>
        <Content body={this.state.description} />
      </div>
    )
  }
}

export default Game
