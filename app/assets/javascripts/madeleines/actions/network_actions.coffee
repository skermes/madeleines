Madeleines.Actions.apiSent = Hippodrome.createAction
  displayName: 'api Sent'
  build: () -> {}

Madeleines.Actions.apiSuccessful = Hippodrome.createAction
  displayName: 'api Successful'
  build: () -> {}

Madeleines.Actions.apiFailed = Hippodrome.createAction
  displayName: 'api Failed'
  build: (reasons) -> {reasons: reasons}

Madeleines.Actions.apiError = Hippodrome.createAction
  displayName: 'api Error'
  build: (response, status) -> {response: response, status: status}
