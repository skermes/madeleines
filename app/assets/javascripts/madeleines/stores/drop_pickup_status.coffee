DropPickUpStatus = Hippodrome.createStore
  initialize: ->
    @_status = undefined

    @dispatch(Madeleines.Actions.dropRemembrance).to(@pending)
    @dispatch(Madeleines.Actions.pickUpRemembrance).to(@pending)
    @dispatch(Madeleines.Actions.updateRemembrance).to(@completed)

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
