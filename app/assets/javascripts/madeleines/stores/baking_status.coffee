BakingStatus = Hippodrome.createStore
  initialize: ->
    @_status = 'none'
    @_failureReasons = undefined

    @dispatch(Madeleines.Actions.bake).to(@pending)
    @dispatch(Madeleines.Actions.bakingSuccessful).to(@successful)
    @dispatch(Madeleines.Actions.bakingFailed).to(@failure)
    @dispatch(Madeleines.Actions.viewBaker).to(@none)

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

Madeleines.Stores.BakingStatus = BakingStatus
