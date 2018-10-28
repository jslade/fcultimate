import React, { Component } from 'react'
import {
  Button,
  ControlLabel,
  FormControl,
  FormGroup,
  HelpBlock
} from 'react-bootstrap'

export default class SignupForm extends Component {
  constructor(props) {
    super(props)

    this.state = {
      name: '',
      team_size: 0,
      comment: ''
    }
  }

  handleChange = e => {
    const name = e.target.id
    const value = e.target.value
    this.setState({ [name]: value })
  }

  handleSubmit = e => {
    e.preventDefault()
    console.log(`submitting: ${JSON.stringify(this.state)}`)
    this.props.onSubmit(this.state)
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit} className="signup">
          <FieldGroup
            id="team_size"
            componentClass="select"
            placeholder="Team size"
            help="What's the smallest team size you're willing to play with?"
            value={this.state.team_size}
            onChange={this.handleChange}
          >
              {this.renderTeamSizeOptions()}
          </FieldGroup>

          <FieldGroup
            id="name"
            type="text"
            placeholder="Name"
            onChange={this.handleChange}
          />

          <FieldGroup
            id="comment"
            type="text"
            placeholder="Comment"
            onChange={this.handleChange}
          />

          <Button type="submit">Add me</Button>
        </form>
      </div>
    )
  }

  renderTeamSizeOptions() {
    const { game } = this.props

    const renderedOptions = [
      <option key={0} value={0}>
        any
      </option>
    ]

    for (var sz = game.min_team_size; sz <= game.max_team_size; sz++) {
      renderedOptions.push(
        <option key={sz} value={sz}>
          {sz} v {sz}
        </option>
      )
    }

    return renderedOptions
  }
}

function FieldGroup({ id, label, help, ...props }) {
  return (
    <FormGroup controlId={id}>
      {label && <ControlLabel>{label}</ControlLabel>}
      <FormControl id={id} {...props} />
      {help && <HelpBlock bsClass="small">{help}</HelpBlock>}
    </FormGroup>
  );
}

