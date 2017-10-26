import React, { Component } from 'react'

class SignupTable extends Component {

  handleRemove = (signup) => {
    console.log(`wimpout: ${JSON.stringify(signup)}`)
    this.props.onRemove(signup)
  }

  render () {
    if (!this.props.game.signups || this.props.game.signups.length == 0) {
      return ( <div /> )
    }

    return (
      <table className="table table-hover">
        <thead className="thead thead-dark">
          <tr>
            <th>Team size</th>
            <th>Name</th>
            <th>Wimp out</th>
          </tr>
        </thead>
        <tbody>
          {this.renderRows()}
        </tbody>
      </table>
    )
  }

  renderRows () {
    return this.props.game.signups.map((signup) => {
      return (
        <tr key={signup.id} className={`signup ${this.rowClass(signup)}`}>
          <td>{this.teamsizeLabel(signup)}</td>
          <td>{signup.name}{this.renderComment(signup.comment)}</td>
          <td>{this.renderDelete(signup)}</td>
        </tr>
      )
    })
  }

  teamsizeLabel = (signup) => {
    const sz = signup.team_size
    return sz>0 ? `${sz} v ${sz}` : 'any'
  }

  rowClass = (signup) => {
    const { game } = this.props
    if (game.status < 3) { // TODO: Get rid of magic number
      return ''
    }

    return signup.team_size <= game.curr_team_size ? 'signup-in' : 'signup-out'
  }

  renderComment (comment) {
    return (
      <div className="comment">
        <small className="form-text text-muted">{comment}</small>
      </div>
    )
  }

  renderDelete(signup) {
    return (
      <span className='glyphicon glyphicon-remove'
            onClick={(e) => this.handleRemove(signup)}/>
    )
  }
}

export default SignupTable
