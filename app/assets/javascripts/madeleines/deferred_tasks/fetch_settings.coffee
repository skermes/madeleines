{applySettings, apiError} = Madeleines.Actions

FetchSettings = Hippodrome.createDeferredTask
  displayName: 'Fetch Settings'
  initialize: (options) ->
    @_lastUserFetched = undefined
    @fetchIfUserChanged(options)

    @dispatch(Madeleines.Actions.updateUser).to(@fetchIfUserChanged)

  fetchIfUserChanged: (payload) ->
    if payload.userId and @_lastUserFetched != payload.userId
      success = (data) -> applySettings(data.settings)
      Madeleines.Api.Settings.index(success, apiError)
      @_lastUserFetched = payload.userId

Madeleines.Tasks.FetchSettings = FetchSettings
