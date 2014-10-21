{bake} = Madeleines.Api.Remembrances

BakeRemembrance = new Hippodrome.SideEffect
  action: Madeleines.Actions.bake
  effect: (payload) ->
    success = ->
    error = Madeleines.Actions.apiError

    bake({url: payload.url}, success, error)

Madeleines.SideEffects.BakeRemembrance = BakeRemembrance
