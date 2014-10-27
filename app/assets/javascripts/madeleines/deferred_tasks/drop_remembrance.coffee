{updateRemembrance, apiError} = Madeleines.Actions

DropRemembrance = new Hippodrome.DeferredTask
  displayName: 'Drop Remembrance'
  action: Madeleines.Actions.dropRemembrance
  task: (payload) ->
    Madeleines.Api.Remembrances.drop(undefined, updateRemembrance, apiError)

Madeleines.Tasks.DropRemembrance = DropRemembrance
