CurrentUser = Hippodrome.createStore
  displayName: 'Current User'
  initialize: (options) ->
    @_id = undefined
    @setUserId(options)

    @dispatch(Madeleines.Actions.updateUser).to(@setUserId);

  setUserId: (payload) ->
    @_id = payload.userId
    @trigger()

  public:
    id: -> @_id

Madeleines.Stores.CurrentUser = CurrentUser
