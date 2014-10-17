TodaysRemembrance = new Hippodrome.Store
  initialize: ->
    @_remembrance = undefined

  dispatches: [{
    action: Madeleines.Actions.updateRemembrance
    callback: 'updateRemembrance'
  }]

  updateRemembrance: (payload) ->
    @_remembrance = payload.remembrance
    @trigger()

  remembrance: ->
    @_remembrance

Madeleines.Stores.TodaysRemembrance = TodaysRemembrance
