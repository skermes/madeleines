{bake} = Madeleines.Actions
{BakingStatus} = Madeleines.Stores
{div, span, form, input} = React.DOM

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
    text = if BakingStatus.isSuccessful() then '' else text
    @setState(
      text: text
      pending: BakingStatus.isPending()
    )

  componentDidMount: ->
    this.refs.input.getDOMNode().focus()
  render: ->
    {Button, BakingStatusMessage} = Madeleines.Components

    if BakingStatus.isDone()
      message = BakingStatusMessage({
        successful: BakingStatus.isSuccessful()
        reasons: BakingStatus.failureReasons()
      })

    btnText = if @state.pending then 'Baking...' else 'Bake'

    div {className: 'baker'},
      message
      span({className: 'baker-prompt'}, 'Something to remember...')
      form {onSubmit: @submit},
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
  submit: (event) ->
    bake(@state.text)

Madeleines.Components.Baker = Baker
