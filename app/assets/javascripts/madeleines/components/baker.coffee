{bake} = Madeleines.Actions
{ApiStatus} = Madeleines.Stores
{div, span, form, input} = React.DOM

Baker = React.createClass
  displayName: 'Baker'
  mixins: [
    ApiStatus.listen('pending', ApiStatus.isPending)
  ]

  componentDidMount: ->
    this.refs.input.getDOMNode().focus()
  render: ->
    {Button, BakingStatusMessage} = Madeleines.Components

    if ApiStatus.isDone()
      message = BakingStatusMessage({
        successful: ApiStatus.isSuccessful()
        reasons: ApiStatus.failureReasons()
      })

    btnText = if @state.pending then 'Baking...' else 'Bake'
    disable = @state.pending

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
