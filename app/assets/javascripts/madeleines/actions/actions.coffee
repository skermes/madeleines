Madeleines.Actions = {}

Madeleines.Actions.startApp = new Hippodrome.Action(
  'start App',
  -> {}
)

Madeleines.Actions.updateRemembrance = new Hippodrome.Action(
  'update Remembrance',
  (remembrance) -> {remembrance: remembrance}
)

Madeleines.Actions.apiError = new Hippodrome.Action(
  'api Error',
  (response, status) -> {response: response, status: status}
)
