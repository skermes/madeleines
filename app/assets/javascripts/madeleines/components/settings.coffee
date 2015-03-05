{ApiStatus, Settings} = Madeleines.Stores
{div, input, label} = React.DOM

Settings = React.createClass
  displayName: 'Settings'

  mixins: [
    ApiStatus.listen('pending', ApiStatus.isPending)
    Settings.listen('settings', Settings.settings)
  ]

  render: ->
    {RadioButton, SettingsStatusMessage, PasswordForm,
     NotificationsForm, ApiKeyForm} = Madeleines.Components

    if ApiStatus.isDone()
      message = SettingsStatusMessage({
        successful: ApiStatus.isSuccessful()
        reasons: ApiStatus.failureReasons()
      })

    div {className: 'settings'},
      message
      PasswordForm({
        pending: @state.pending
        networkAction: ApiStatus.action()
      })
      NotificationsForm({
        pending: @state.pending
        networkAction: ApiStatus.action()
        settings: @state.settings
      })
      ApiKeyForm({
        settings: @state.settings
      })

Madeleines.Components.Settings = Settings
