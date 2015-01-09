{updateUser, apiError, loginFailed} = Madeleines.Actions

LogInOut = Hippodrome.createDeferredTask
  displayName: 'Log In Out'
  initialize: (options) ->
    @dispatch(Madeleines.Actions.login).to(@login)
    @dispatch(Madeleines.Actions.logout).to(@logout)

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

Madeleines.Tasks.LogInOut = LogInOut
