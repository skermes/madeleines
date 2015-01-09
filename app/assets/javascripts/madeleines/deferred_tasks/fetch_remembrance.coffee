{updateRemembrance, apiError} = Madeleines.Actions

FetchRemembrance = Hippodrome.createDeferredTask
  displayName: 'Fetch Remembrance'
  initialize: (options) ->
    @_lastUserFetched = undefined
    @fetchIfUserChanged(options)

    @dispatch(Madeleines.Actions.updateUser).to(@fetchIfUserChanged)

  fetchIfUserChanged: (payload) ->
    if payload.userId and  @_lastUserFetched != payload.userId
      Madeleines.Api.Remembrances.bite(updateRemembrance, apiError)
      @_lastUserFetched = payload.userId

Madeleines.Tasks.FetchRemembrance = FetchRemembrance
