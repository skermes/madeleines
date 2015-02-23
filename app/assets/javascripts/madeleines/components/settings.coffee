{div, input, label} = React.DOM

Settings = React.createClass
  displayName: 'Settings'
  render: ->
    div {className: 'settings'},
      div({className: 'section-heading'}, 'Password')
      label({htmlFor: 'old-password'}, 'Old Password')
      input({type: 'password', id: 'old-password'})
      label({htmlFor: 'new-password'}, 'New Password')
      input({type: 'password', id: 'new-password'})
      input({type: 'submit', className: 'button', value: 'Change Password', disabled: true})

      div({className: 'section-heading'}, 'Notifications')
      input({type: 'radio', id: 'notifications-yes'})
      label({htmlFor: 'notifications-yes'}, 'Yes, I want to get daily notifications')
      input({type: 'radio', id: 'notifications-no'})
      label({htmlFor: 'notifications-no'}, 'No, don\'t send me any notifications')
      input({type: 'submit', className: 'button', value: 'Save', disabled: true})




Madeleines.Components.Settings = Settings
