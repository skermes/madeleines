{updateUser, apiError, loginFailed} = Madeleines.Actions

LogInOut = new Hippodrome.DeferredTask
  displayName: 'Log In Out'
  dispatches: [{
    action: Madeleines.Actions.login
    callback: 'login'
  },{
    action: Madeleines.Actions.logout
    callback: 'logout'
  }]

  login: (payload) ->
    data = {email: payload.email, password: payload.password}
    success = (response) -> updateUser(response.user)
    error = (response, status) ->
      if status == 401
        loginFailed()
      else
        apiError(response, status)
    Madeleines.Api.LogInOut.login(data, success, error)

  logout: (payload) ->
    success = (response) -> updateUser(undefined)
    Madeleines.Api.LogInOut.logout(undefined, success, apiError)
