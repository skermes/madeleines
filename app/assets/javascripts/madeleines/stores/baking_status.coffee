BakingStatus = new Hippodrome.Store
  initialize: ->
    @_status = 'none'
    @_failureReasons = undefined

  dispatches: [{
    action: Madeleines.Actions.bake
    callback: 'pending'
  }, {
    action: Madeleines.Actions.bakingSuccessful
    callback: 'successful'
  }, {
    action: Madeleines.Actions.bakingFailed
    callback: 'failure'
  }]

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
