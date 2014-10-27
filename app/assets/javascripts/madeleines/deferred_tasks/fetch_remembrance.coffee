{updateRemembrance, apiError} = Madeleines.Actions

FetchRemembrance = new Hippodrome.DeferredTask
  displayName: 'Fetch Remembrance'
  action: Madeleines.Actions.startApp,
  task: (payload) ->
    Madeleines.Api.Remembrances.bite(updateRemembrance, apiError)

Madeleines.Tasks.FetchRemembrance = FetchRemembrance
