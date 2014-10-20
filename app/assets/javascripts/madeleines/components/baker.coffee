{div, span, input} = React.DOM

Baker = React.createClass
  displayName: 'Baker'
  componentDidMount: ->
    this.refs.input.getDOMNode().focus()
  render: ->
    {Button} = Madeleines.Components

    div {className: 'baker'},
      span({className: 'baker-prompt'}, 'Something to remember...')
      input({className: 'baker-input', type: 'text', ref: 'input'}),
      Button({className: 'baker-button'}, 'Bake')

Madeleines.Components.Baker = Baker
