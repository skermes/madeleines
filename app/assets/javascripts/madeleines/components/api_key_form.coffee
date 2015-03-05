{div, span, input} = React.DOM

API_KEY_LENGTH = 36

ApiKeyForm = React.createClass
  displayName: 'Api Key Form'
  render: ->
    if @props.settings
      apiKey = @props.settings.api_key

    div {className: 'section'},
      div({className: 'section-heading'}, 'Apps')
      span({}, 'This is your API key: ')
      div({className: 'selector-wrap'},
        input({
          className: 'api-key-selector'
          value: apiKey
          readOnly: true
          onClick: @selectKey
          ref: 'keySelector'
        }))
      span({}, 'There are many like it, but this one is yours.  To use apps other than the web client, give them this key instead of your username and password.')

  selectKey: (event) ->
    elem = @refs.keySelector.getDOMNode()
    elem.select()
    # elem.focus()
    # elem.selectStart = 0
    # elem.selectionEnd = API_KEY_LENGTH

Madeleines.Components.ApiKeyForm = ApiKeyForm
