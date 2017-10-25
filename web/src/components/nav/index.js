import React from 'react'
import { NavLink } from 'react-router-dom'

const Nav = () => (
  <div className='App-nav'>
    <ul>
      <li><NavLink to='/'>Home</NavLink></li>
      <li><NavLink to='/contact'>Contact</NavLink></li>
    </ul>
  </div>
)

export default Nav
