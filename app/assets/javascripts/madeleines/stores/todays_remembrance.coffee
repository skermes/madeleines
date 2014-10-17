TodaysRemembrance = new Hippodrome.Store
  initialize: ->
    @remembrance = {}

  dispatches: [{
    action: Madeleines.Actions.updateRemembrance
    callback: 'updateRemembrance'
  }]

  updateRemembrance: (payload) ->
    @remembrance = payload.remembrance
    @trigger()

  remembrance: ->
    @remembrance

Madeleines.Stores.TodaysRemembrance = TodaysRemembrance
