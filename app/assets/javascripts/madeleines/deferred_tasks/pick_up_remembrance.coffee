{updateRemembrance, apiError} = Madeleines.Actions

PickUpRemembrance = new Hippodrome.DeferredTask
  displayName: 'Pick Up Remembrance'
  action: Madeleines.Actions.pickUpRemembrance
  task: (payload) ->
    Madeleines.Api.Remembrances.pickUp(undefined, updateRemembrance, apiError)

Madeleines.Tasks.PickUpRemembrance = PickUpRemembrance
