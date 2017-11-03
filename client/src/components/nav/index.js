import React, { Component } from 'react'
import { Navbar, Nav as NavGroup, NavItem } from 'react-bootstrap'

export default class Nav extends Component {
  onClick = (event) => {
    // These NavItems should navigate automatically without the
    // explicit onClick handler, but it's not working for some reason.
    event.propagateDefault(false)
  }

  render () {
    // TODO: Load the specific game nav items from a contact block
    //      to make it configurable per deployment
    return (
      <Navbar inverse collapseOnSelect>
        <Navbar.Header>
          <Navbar.Brand>
            <a href="/">fcultimate</a>
          </Navbar.Brand>
          <Navbar.Toggle />
        </Navbar.Header>
        <Navbar.Collapse>
          <NavGroup activeHref={window.location.pathname}>
            <NavItem href="/hpnc" onClick={this.onClick}>HP Mon/Thu pickup</NavItem>
            <NavItem href="/hp_fri_soccer" onClick={this.onClick}>Fri soccer</NavItem>
          </NavGroup>
          <NavGroup activeHref={window.location.pathname} pullRight>
            <NavItem href="/contact" onClick={this.onClick}>Contact</NavItem>
            <NavItem href="/about" onClick={this.onClick}>About</NavItem>
          </NavGroup>
        </Navbar.Collapse>
      </Navbar>
    )
  }
}
