CurrentUser = new Hippodrome.Store
  displayName: 'Current User'
  initialize: ->
    @_id = undefined
  dispatches: [{
    action: Madeleines.Actions.startApp
    callback: 'setUserId'
  },{
    action: Madeleines.Actions.updateUser
    callback: 'setUserId'
  }]

  setUserId: (payload) ->
    @_id = payload.userId
    @trigger()

  public:
    id: -> @_id

Madeleines.Stores.CurrentUser = CurrentUser
