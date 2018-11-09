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
        <Col md={8} xs={9}>
          {this.props.children}
        </Col>
        <Col md={4} sm={3}>
          <div style={{ float: 'right' }}>
            {this.props.sidebar}
          </div>
        </Col>
      </div>
    )
  }

  renderWithoutSidebar () {
    return (
      <Col md={8} xs={9}>
        {this.props.children}
      </Col>
    )
  }
}
