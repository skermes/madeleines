TodaysRemembrance = Hippodrome.createStore
  initialize: ->
    @_remembrance = undefined
    @_pending = true

    @dispatch(Madeleines.Actions.updateRemembrance).to(@updateRemembrance)

  updateRemembrance: (payload) ->
    @_remembrance = payload.remembrance
    @_pending = false
    @trigger()

  public:
    remembrance: -> @_remembrance
    pending: -> @_pending

Madeleines.Stores.TodaysRemembrance = TodaysRemembrance
