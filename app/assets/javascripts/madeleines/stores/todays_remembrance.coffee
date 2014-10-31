TodaysRemembrance = new Hippodrome.Store
  initialize: ->
    @_remembrance = undefined
    @_pending = true

  dispatches: [{
    action: Madeleines.Actions.updateRemembrance
    callback: 'updateRemembrance'
  }]

  updateRemembrance: (payload) ->
    @_remembrance = payload.remembrance
    @_pending = false
    @trigger()

  public:
    remembrance: -> @_remembrance
    pending: -> @_pending

Madeleines.Stores.TodaysRemembrance = TodaysRemembrance
