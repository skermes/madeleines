LoginFailed = Hippodrome.createStore
  displayName: 'Login Failed'
  inititialized: ->
    @_failed = false

    @dispatch(Madeleines.Actions.loginFailed).to(@failed)
    @dispatch(Madeleines.Actions.updateUser).to(@succeeded)

  failed: ->
    @_failed = true
    @trigger()
  succeeded: ->
    @_failed = false
    @trigger()

  public:
    hasFailed: -> @_failed

Madeleines.Stores.LoginFailed = LoginFailed
