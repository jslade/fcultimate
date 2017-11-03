import React, { Component } from 'react'

import Content from '../content'
import MainLayout from '../main-layout'

export default class Contact extends Component {
  render () {
    return (
      <MainLayout>
        <Content name={'contact_us'} />
      </MainLayout>
    )
  }
}
