{bake} = Madeleines.Api.Remembrances

BakeRemembrance = Hippodrome.createDeferredTask
  displayName: 'Bake Remembrance'
  action: Madeleines.Actions.bake
  task: (payload) ->
    url = payload.url.trim()

    success = (response) ->
      if response.baked
        Madeleines.Actions.bakingSuccessful()
      else
        Madeleines.Actions.bakingFailed(response.reasons)

    error = Madeleines.Actions.apiError

    bake({url: url}, success, error)

Madeleines.Tasks.BakeRemembrance = BakeRemembrance
