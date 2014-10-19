{updateRemembrance, apiError} = Madeleines.Actions

DropRemembrance = new Hippodrome.SideEffect
  action: Madeleines.Actions.dropRemembrance
  effect: (payload) ->
    Madeleines.Api.Remembrances.drop(undefined, updateRemembrance, apiError)

Madeleines.SideEffects.DropRemembrance = DropRemembrance
