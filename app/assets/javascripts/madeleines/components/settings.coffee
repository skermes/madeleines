{div, input, label} = React.DOM

Settings = React.createClass
  displayName: 'Settings'

  getInitialState: ->
    return {
      notifications: false
    }

  render: ->
    {RadioButton} = Madeleines.Components

    div {className: 'settings'},
      div({className: 'section-heading'}, 'Password')
      label({htmlFor: 'old-password'}, 'Old Password')
      input({type: 'password', id: 'old-password'})
      label({htmlFor: 'new-password'}, 'New Password')
      input({type: 'password', id: 'new-password'})
      input({type: 'submit', className: 'button', value: 'Change Password', disabled: true})

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
