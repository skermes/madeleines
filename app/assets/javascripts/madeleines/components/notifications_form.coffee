{div, span, input, form} = React.DOM

NotificationsForm = React.createClass
  displayName: 'Notifications Form'

  getInitialState: ->
    if @props.settings
      return @getSettingsState(@props.settings)
    else
      return {
        notifications: undefined
        twitter: undefined
      }

  componentWillReceiveProps: (newProps) ->
    if newProps.settings
      @setState(@getSettingsState(newProps.settings))

  getSettingsState: (settings) ->
    return {
      notifications: settings.notifications
      twitter: settings.twitter
    }

  componentDidUpdate: (prevProps, prevState) ->
    shouldFocus = @state.notifications == 'twitter' and
                  prevState.notifications != 'twitter' and
                  prevState.notifications != undefined
    if shouldFocus
      @refs.twitterInput.getDOMNode().focus()

  render: ->
    {RadioButton} = Madeleines.Components

    if @props.settings
      emailSpan = span({}, ' to ',
                           span({className: 'email'}, @props.settings.email))

    twitterEnabled = @state.notifications == 'twitter'
    twitterPrefix = span({
      className: "twitter-prefix #{if !twitterEnabled then 'disabled' else ''}"
    }, '@')
    twitterInput = input({
      type: 'text'
      className: 'twitter-input'
      value: @state.twitter
      onChange: @twitterHandle
      onClick: @notificationsTwitter
      disabled: !twitterEnabled
      ref: 'twitterInput'
    })
    handleInput = span({style: {display: 'inline-block'}}, twitterPrefix, twitterInput)

    disable = @props.pending and
              @props.networkAction == Madeleines.Actions.updateSettings

    buttonText = 'Save'
    if disable
      buttonText = 'Saving...'

    form {onSubmit: @updateSettings},
      div({className: 'section-heading'}, 'Notifications')
      RadioButton({
        name: 'notifications'
        onChange: @notificationsEmail
        checked: @state.notifications == 'email'
      }, 'Send daily email notifications', emailSpan)
      RadioButton({
        name: 'notifications'
        onChange: @notificationsTwitter
        checked: twitterEnabled
      }, 'Tweet daily notifications to ', handleInput)
      RadioButton({
        name: 'notification'
        onChange: @notificationsNone
        checked: @state.notifications == 'none'
      }, 'Don\'t send me any notifications')
      input({
        type: 'submit'
        className: 'button'
        value: buttonText
        disabled: disable
      })

  notificationsEmail: ->
    @setState(notifications: 'email')
  notificationsTwitter: ->
    @setState(notifications: 'twitter')
  notificationsNone: ->
    @setState(notifications: 'none')
  twitterHandle: (event) ->
    @setState(twitter: event.target.value)

  updateSettings: (event) ->
    event.preventDefault()
    updates = {
      notifications: @state.notifications
      twitter: @state.twitter
    }
    newSettings =_.merge(_.clone(@props.settings), updates)
    Madeleines.Actions.updateSettings(newSettings)

Madeleines.Components.NotificationsForm = NotificationsForm
