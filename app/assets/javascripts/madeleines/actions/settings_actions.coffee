Madeleines.Actions.changePassword = Hippodrome.createAction
  displayName: 'change Password'
  build: (oldPassword, newPassword) ->
    oldPassword: oldPassword
    newPassword: newPassword

# Update is used when you want the changes to go back to the server, apply
# when you don't.

Madeleines.Actions.updateSettings = Hippodrome.createAction
  displayName: 'update Settings'
  build: (settings) -> {settings: settings}

Madeleines.Actions.applySettings = Hippodrome.createAction
  displayName: 'apply Settings'
  build: (settings) -> {settings: settings}
