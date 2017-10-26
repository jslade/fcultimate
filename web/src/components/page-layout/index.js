import React, { Component } from 'react'

import Nav from '../nav'

class PageLayout extends Component {

  render () {
    return (
      <div className='container'>
        <div className='row'>
          <Nav />
        </div>
        <div className='row'>
          <div className='col-sm'>
            {this.props.children}
          </div>
          <div className='col-sm'>
            <Sidebar />
          </div>
        </div>
      </div>
    )
  }
}

const Sidebar = () => (
  <div>Sidebar test</div>
)

export default PageLayout
