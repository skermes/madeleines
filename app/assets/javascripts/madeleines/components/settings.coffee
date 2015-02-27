{ApiStatus} = Madeleines.Stores
{div, input, label} = React.DOM

Settings = React.createClass
  displayName: 'Settings'

  mixins: [
    ApiStatus.listen('pending', ApiStatus.isPending)
  ]

  getInitialState: ->
    return {
      notifications: false
    }

  render: ->
    {RadioButton, SettingsStatusMessage, PasswordForm} = Madeleines.Components

    if ApiStatus.isDone()
      message = SettingsStatusMessage({
        successful: ApiStatus.isSuccessful()
        reasons: ApiStatus.failureReasons()
      })

    div {className: 'settings'},
      message
      PasswordForm({pending: @state.pending})

      div({className: 'section-heading'}, 'Notifications')
      RadioButton({
        name: 'notifications'
        value: 'yes'
        onChange: @notificationsYes
        checked: @state.notifications
      }, 'Yes, I want to get daily notifications')
      RadioButton({
        name: 'notifications'
        value: 'no'
        onChange: @notificationsNo
        checked: !@state.notifications
      }, 'No, don\'t send me any notifications')
      input({type: 'submit', className: 'button', value: 'Save', disabled: true})

  notificationsYes: ->
    @setState(notifications: true)
  notificationsNo: ->
    @setState(notifications: false)



Madeleines.Components.Settings = Settings
