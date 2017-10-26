import React, { Component } from 'react'

class SignupForm extends Component {
  constructor(props) {
    super(props)

    this.state = {
      name: '',
      team_size: 0,
      comment: ''
    }
  }

  handleChange = (e) => {
    const name = e.target.name
    const value = e.target.value
    this.setState({ [name]: value })
   }

  handleSubmit = (e) => {
    e.preventDefault()
    console.log(`submitting: ${JSON.stringify(this.state)}`)
    this.props.onSubmit(this.state)
  }

  render () {
    return (
      <div className="App-game-signup-form">
        <form onSubmit={this.handleSubmit} >
          <div className="form-group">
            <label htmlFor="name">Name</label>
            <input type="text" className="form-control"
                   name="name" placeholder="Name"
                   value={this.state.name}
                   onChange={this.handleChange} />
          </div>

          <div className="form-group">
            <label htmlFor="team_size">Team size</label>
            <select className="form-control" name="team_size"
                    value={this.state.team_size}
                    onChange={this.handleChange} >
              {this.renderTeamSizeOptions()}
            </select>
            <small id="team_size_help" className="form-text text-muted">{"What's the smallest team size you're willing to play with?"}</small>
          </div>

          <div className="form-group">
            <label htmlFor="comment">Comment</label>
            <input type="text" className="form-control"
                   name="comment" placeholder="Comment"
                   value={this.state.comment}
                   onChange={this.handleChange} />
            <small id="comment_help" className="form-text text-muted">{"What's on yer mind?"}</small>
          </div>

          <button type="submit" className="btn btn-primary">Add me</button>
        </form>
      </div>
    )
  }

  renderTeamSizeOptions () {
    const { game } = this.props

    const renderedOptions = [
      <option key={0} value={0}>any</option>
    ]

    for ( var sz = game.min_team_size; sz <= game.max_team_size; sz++ ) {
      renderedOptions.push(<option key={sz} value={sz}>{sz} v {sz}</option>)
    }

    return renderedOptions
  }
}

export default SignupForm
