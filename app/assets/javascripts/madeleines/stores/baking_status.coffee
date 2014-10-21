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
    @_failureReason = payload.reason
    @trigger()

  isPending: ->
    @_status == 'pending'
  isSuccessful: ->
    @_status == 'successful'
  isFailure: ->
    @_status == 'failure'
  failureReason: ->
    @_failureReasons

Madeleines.Stores.BakingStatus = BakingStatus
