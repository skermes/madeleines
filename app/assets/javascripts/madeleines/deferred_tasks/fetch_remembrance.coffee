{updateRemembrance, apiError} = Madeleines.Actions

FetchRemembrance = new Hippodrome.DeferredTask
  displayName: 'Fetch Remembrance'
  initialize: ->
    @_lastUserFetched = undefined
  dispatches: [{
    action: Madeleines.Actions.startApp
    callback: 'fetchIfUserChanged'
  },{
    action: Madeleines.Actions.updateUser
    callback: 'fetchIfUserChanged'
  }]

  fetchIfUserChanged: (payload) ->
    if payload.userId and  @_lastUserFetched != payload.userId
      Madeleines.Api.Remembrances.bite(updateRemembrance, apiError)
      @_lastUserFetched = payload.userId

Madeleines.Tasks.FetchRemembrance = FetchRemembrance
