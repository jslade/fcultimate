import React, { Component } from 'react'
import Markdown from 'react-markdown'

import API from '../../services/api'

export default class Content extends Component {
  constructor () {
    super()
    this.api = new API()
    this.state = {
      markdown: '... missing content ...'
    }
  }

  componentDidMount () {
    this.setContentFromProps(this.props)
  }

  componentWillReceiveProps (nextProps) {
    this.setContentFromProps(nextProps)
  }

  setContentFromProps = (props) => {
    if (props.body !== undefined) {
      this.setContent(props.body)
    } else if (props.name) {
      this.api.GET({ path: `contents/${props.name}` })
        .then((json) => this.handleResponse(json))
    }
  }

  handleResponse = (json) => {
    this.setContent(json ? json.body : {})
  }

  setContent = (body) => {
    this.setState({ markdown: this.prepMarkdown(body) })
  }

  prepMarkdown = (body) => {
    return body
  }

  render () {
    return (
      <Markdown source={this.state.markdown} />
    )
  }
}
