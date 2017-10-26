import React, { Component } from 'react'
import { Grid, Row } from 'react-bootstrap'

import Nav from '../nav'

export default class PageLayout extends Component {
  render () {
    return (
      <Grid>
        <Row>
          <Nav />
        </Row>
        <Row>
          {this.props.children}
        </Row>
      </Grid>
    )
  }
}
