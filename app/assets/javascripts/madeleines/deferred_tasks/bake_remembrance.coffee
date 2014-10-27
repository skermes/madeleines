{bake} = Madeleines.Api.Remembrances

BakeRemembrance = new Hippodrome.DeferredTask
  displayName: 'Bake Remembrance'
  action: Madeleines.Actions.bake
  task: (payload) ->
    success = (response) ->
      if response.baked
        Madeleines.Actions.bakingSuccessful()
      else
        Madeleines.Actions.bakingFailed(response.reasons)

    error = Madeleines.Actions.apiError

    bake({url: payload.url}, success, error)

Madeleines.Tasks.BakeRemembrance = BakeRemembrance
