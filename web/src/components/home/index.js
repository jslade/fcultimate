import React, { Component } from 'react'

import Content from '../content'
import MainLayout from '../main-layout'

class Home extends Component {
  render () {
    return (
      <MainLayout>
        <Content name={'home'} />
      </MainLayout>
    )
  }
}

export default Home
