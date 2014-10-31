LoginFailed = new Hippodrome.Store
  displayName: 'Login Failed'
  inititialized: ->
    @_failed = false
  dispatches: [{
    action: Madeleines.Actions.loginFailed
    callback: 'failed'
  },{
    action: Madeleines.Actions.updateUser
    callback: 'succeeded'
  }]

  failed: ->
    @_failed = true
    @trigger()
  succeeded: ->
    @_failed = false
    @trigger()

  public:
    hasFailed: -> @_failed

Madeleines.Stores.LoginFailed = LoginFailed
