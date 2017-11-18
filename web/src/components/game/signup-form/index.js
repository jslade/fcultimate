import React, { Component } from 'react'

export default class SignupForm extends Component {
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
      <div>
        <form onSubmit={this.handleSubmit} className='form-horizontal'>
          <div className="form-group">
            <label htmlFor="name" className='col-sm-2 control-label'>Name</label>
            <div className='col-sm-10'>
              <input type="text" className="form-control input-sm"
                     name="name" placeholder="Name"
                     value={this.state.name}
                     onChange={this.handleChange} />
            </div>
          </div>

          <div className="form-group">
            <label htmlFor="team_size" className='col-sm-2 control-label'>Team size</label>
            <div className='col-sm-10'>
              <select className="form-control input-sm" name="team_size"
                      value={this.state.team_size}
                      onChange={this.handleChange} >
                {this.renderTeamSizeOptions()}
              </select>
              <small id="team_size_help" className="form-text text-muted">{"What's the smallest team size you're willing to play with?"}</small>
            </div>
          </div>

          <div className="form-group">
            <label htmlFor="comment" className='col-sm-2 control-label'>Comment</label>
            <div className='col-sm-10'>
              <input type="text" className="form-control input-sm"
                     name="comment" placeholder="Comment"
                     value={this.state.comment}
                     onChange={this.handleChange} />
              <small id="comment_help" className="form-text text-muted">{"What's on yer mind?"}</small>
            </div>
          </div>

          <div className='form-group'>
            <div className='col-sm-2'/>
            <div className='col-sm-10'>
              <button type="submit" className="btn btn-primary input-sm">Add me</button>
            </div>
          </div>
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
