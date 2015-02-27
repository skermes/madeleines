Madeleines.Tasks.makeNetworkTask = (action, api, bodyFn) ->
  Hippodrome.createDeferredTask
    displayName: "Send #{action.displayName}"
    action: action
    task: (payload) ->
      body = bodyFn(payload)

      success = (response) ->
        if response.successful
          Madeleines.Actions.apiSuccessful()
        else
          Madeleines.Actions.apiFailed(response.reasons)

      error = Madeleines.Actions.apiError

      Madeleines.Actions.apiSent()
      api(body, success, error)
