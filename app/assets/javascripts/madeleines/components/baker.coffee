{bake} = Madeleines.Actions
{BakingStatus} = Madeleines.Stores
{div, span, form, input} = React.DOM

Baker = React.createClass
  displayName: 'Baker'
  mixins: [
    BakingStatus.listenWith('onBakingStatus')
  ]
  onBakingStatus: ->
    text = if BakingStatus.isSuccessful() then '' else text
    return {
      text: text
      pending: BakingStatus.isPending()
    }

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
    disable = @state.pending or (not @state.text) or @state.text.trim() == ''

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
          disabled: disable
          action: bake
          args: [@state.text]}, btnText)

  textChange: (event) ->
    @setState(text: event.target.value)
  submit: (event) ->
    event.preventDefault()
    if not @state.pending and @state.text.trim() != ''
      bake(@state.text)

Madeleines.Components.Baker = Baker
