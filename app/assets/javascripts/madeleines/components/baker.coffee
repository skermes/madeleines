{bake} = Madeleines.Actions
{BakingStatus} = Madeleines.Stores
{div, span, input} = React.DOM

Baker = React.createClass
  displayName: 'Baker'
  mixins: [
    BakingStatus.listen('onBakingStatus')
  ]
  getInitialState: ->
    return {
      text: ''
      pending: BakingStatus.isPending()
    }
  onBakingStatus: ->
    @setState(pending: BakingStatus.isPending())

  componentDidMount: ->
    this.refs.input.getDOMNode().focus()
  render: ->
    {Button} = Madeleines.Components

    btnText = if @state.pending then 'Baking...' else 'Bake'

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
        disabled: @state.pending
        action: bake
        args: [@state.text]}, btnText)

  textChange: (event) ->
    @setState(text: event.target.value)

Madeleines.Components.Baker = Baker
