import React, { Component } from 'react'

import Content from '../content'
import MainLayout from '../main-layout'

export default class About extends Component {
  render () {
    return (
      <MainLayout>
        <Content name={'about_us'} />
      </MainLayout>
    )
  }
}
