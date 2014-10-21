{bake} = Madeleines.Actions
{div, span, input} = React.DOM

Baker = React.createClass
  displayName: 'Baker'
  getInitialState: ->
    return {
      text: ''
    }
  componentDidMount: ->
    this.refs.input.getDOMNode().focus()
  render: ->
    {Button} = Madeleines.Components

    div {className: 'baker'},
      span({className: 'baker-prompt'}, 'Something to remember...')
      input({
        className: 'baker-input'
        type: 'text'
        value: @state.text
        onChange: @textChange
        ref: 'input'}),
      Button({
        className: 'baker-button'
        action: bake
        args: [@state.text]}, 'Bake')

  textChange: (event) ->
    @setState(text: event.target.value)

Madeleines.Components.Baker = Baker
