import React, { Component } from 'react'
import Markdown from 'react-markdown'

export default class Content extends Component {
  constructor () {
    super()
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
      window.fetch(`api/contents/${props.name}`)
        .then(response => response.json())
        .then(json => this.handleResponse(json))
        .catch(error => console.log(error))
    }
  }

  handleResponse = (json) => {
    this.setContent(json.body)
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
