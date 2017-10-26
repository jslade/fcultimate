import React, { Component } from 'react'
import { Grid, Row, Col } from 'react-bootstrap'

import Nav from '../nav'

class PageLayout extends Component {

  render () {
    return (
      <Grid>
        <Row>
          <Nav />
        </Row>
        <Row>
          <Col md={9} xs={10}>
            {this.props.children}
          </Col>
          <Col md={3} sm={2}>
            <Sidebar />
          </Col>
        </Row>
      </Grid>
    )
  }
}

const Sidebar = () => (
  <div>Sidebar test</div>
)

export default PageLayout
