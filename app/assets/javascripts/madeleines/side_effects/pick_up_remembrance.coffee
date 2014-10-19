{updateRemembrance, apiError} = Madeleines.Actions

PickUpRemembrance = new Hippodrome.SideEffect
  action: Madeleines.Actions.pickUpRemembrance
  effect: (payload) ->
    Madeleines.Api.Remembrances.pickUp(undefined, updateRemembrance, apiError)

Madeleines.SideEffects.PickUpRemembrance = PickUpRemembrance
