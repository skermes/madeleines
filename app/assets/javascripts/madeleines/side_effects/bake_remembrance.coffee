{bake} = Madeleines.Api.Remembrances

BakeRemembrance = new Hippodrome.SideEffect
  action: Madeleines.Actions.bake
  effect: (payload) ->
    success = (response) ->
      if response.baked
        Madeleines.Actions.bakingSuccessful()
      else
        Madeleines.Actions.bakingFailed(reasons: response.reasons)

    error = Madeleines.Actions.apiError

    bake({url: payload.url}, success, error)

Madeleines.SideEffects.BakeRemembrance = BakeRemembrance
