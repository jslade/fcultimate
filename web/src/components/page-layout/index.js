import React, { Component } from 'react'

import Nav from '../nav'

class PageLayout extends Component {

  render () {
    return (
      <div className='App'>
        <Nav />
        <div className='App-main'>
          {this.props.children}
        </div>
      </div>
    )
  }
}

export default PageLayout
