import React, { Component } from 'react'
import { Col } from 'react-bootstrap'

// This is to be rendered as a child of the PageLayout,
// occupying the second <Row>
export default class MainLayout extends Component {
  render () {
    const { sidebar } = this.props

    if (sidebar) {
      return this.renderWithSidebar()
    } else {
      return this.renderWithoutSidebar()
    }
  }

  renderWithSidebar () {
    return (
      <div>
        <Col md={9} xs={10}>
          {this.props.children}
        </Col>
        <Col md={3} sm={2}>
          {this.props.sidebar}
        </Col>
      </div>
    )
  }

  renderWithoutSidebar () {
    return (
      <Col>
        {this.props.children}
      </Col>
    )
  }
}
