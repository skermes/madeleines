{div} = React.DOM

SettingsStatusMessage = React.createClass
  displayName: 'Settings Status Message'
  render: ->
    if @props.successful
      message = 'Saved'
      className = 'status-message-successful'
    else
      reason = @props.reasons[0]
      if reason == 'bad_password'
        message = 'Your old password didn\'t match.'
      else
        message = 'We don\'t know why, but that didn\'t work.  Try again?'
      className = 'status-message-failed'

    div {className: className}, message

Madeleines.Components.SettingsStatusMessage = SettingsStatusMessage
