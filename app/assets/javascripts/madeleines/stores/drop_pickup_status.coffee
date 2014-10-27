DropPickUpStatus = new Hippodrome.Store
  initialize: ->
    @_status = undefined

  dispatches: [{
    action: Madeleines.Actions.dropRemembrance
    callback: 'pending'
  }, {
    action: Madeleines.Actions.pickUpRemembrance
    callback: 'pending'
  }, {
    action: Madeleines.Actions.updateRemembrance
    callback: 'completed'
  }]

  pending: (payload) ->
    @_status = 'pending'
    @trigger()
  completed: (payload) ->
    @_status = 'completed'
    @trigger()

  public:
    isPending: ->
      @_status == 'pending'

Madeleines.Stores.DropPickUpStatus = DropPickUpStatus
