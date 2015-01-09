Madeleines.Actions.bake = Hippodrome.createAction
  displayName: 'bake'
  build: (text) -> {url: text}

Madeleines.Actions.bakingSuccessful = Hippodrome.createAction
  displayName: 'baking Successful'
  build: () -> {}

Madeleines.Actions.bakingFailed = Hippodrome.createAction
  displayName: 'baking Failed'
  build: (reasons) -> {reasons: reasons}
