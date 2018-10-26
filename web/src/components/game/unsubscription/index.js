import React, { Component } from 'react'
import { Link } from 'react-router-dom'

export default class Unsubscription extends Component {
  constructor(props) {
    super(props)

    this.state = {
      email: '',
      unsubscribe: true
    }
  }

  handleChange = e => {
    const name = e.target.name
    const value = e.target.value
    this.setState({ [name]: value })
  }

  handleSubmit = e => {
    e.preventDefault()
    console.log(`submitting: ${JSON.stringify(this.state)}`)
    this.props.onSubscribe(this.state)
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit} className="form-horizontal signup">
          <div className="form-group form-group-sm">
            <label htmlFor="email" className="col-sm-2 control-label">
              Email
            </label>
            <div className="col-sm-10">
              <input
                type="text"
                className="form-control"
                name="email"
                placeholder="Email"
                value={this.state.email}
                onChange={this.handleChange}
              />
            </div>
          </div>

          <div className="form-group form-group-sm">
            <div className="col-sm-2" />
            <div className="col-sm-2">
              <button type="submit" className="btn btn-primary">
                Unsubscribe
              </button>
            </div>
            <div className="col-sm-1">
              <Link to={`/${this.props.game.name}`} className="btn">
                Cancel
              </Link>
            </div>
          </div>
        </form>
      </div>
    )
  }
}
