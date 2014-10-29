CurrentUser = new Hippodrome.Store
  displayName: 'Current User'
  initialize: ->
    @_id = undefined
  dispatches: [{
    action: Madeleines.Actions.startApp
    callback: (payload) ->
      @_id = payload.id
      @trigger()
  }]

  public:
    id: -> @_id

Madeleines.Stores.CurrentUser = CurrentUser
