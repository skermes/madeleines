ApiStatus = Hippodrome.createStore
  initialize: ->
    @_status = 'none'
    @_failureReasons = undefined

    @dispatch(Madeleines.Actions.apiSent).to(@pending)
    @dispatch(Madeleines.Actions.apiSuccessful).to(@successful)
    @dispatch(Madeleines.Actions.apiFailed).to(@failure)
    @dispatch(Madeleines.Actions.viewBaker).to(@none)
    @dispatch(Madeleines.Actions.viewSettings).to(@none)
    @dispatch(Madeleines.Actions.login).to(@none)

  pending: (payload) ->
    @_status = 'pending'
    @trigger()
  successful: (payload) ->
    @_status = 'successful'
    @trigger()
  failure: (payload) ->
    @_status = 'failure'
    @_failureReasons = payload.reasons
    @trigger()
  none: (payload) ->
    @_status = 'none'
    @trigger()

  public:
    isPending: ->
      @_status == 'pending'
    isSuccessful: ->
      @_status == 'successful'
    isDone: ->
      @_status == 'failure' or @_status == 'successful'
    failureReasons: ->
      @_failureReasons

Madeleines.Stores.ApiStatus = ApiStatus
