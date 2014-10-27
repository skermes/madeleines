{updateRemembrance, apiError} = Madeleines.Actions

FetchRemembrance = new Hippodrome.SideEffect
  action: Madeleines.Actions.startApp,
  effect: (payload) ->
    Madeleines.Api.Remembrances.bite(updateRemembrance, apiError)

Madeleines.SideEffects.FetchRemembrance = FetchRemembrance
