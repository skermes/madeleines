Madeleines.Actions = {}

Madeleines.Actions.startApp = new Hippodrome.Action(
  'start App',
  -> {}
)

Madeleines.Actions.updateRemembrance = new Hippodrome.Action(
  'update Remembrance',
  (remembrance) -> {remembrance: remembrance}
)

Madeleines.Actions.dropRemembrance = new Hippodrome.Action(
  'drop Remembrance',
  () -> {}
)

Madeleines.Actions.pickUpRemembrance = new Hippodrome.Action(
  'pick Up Remembrance',
  () -> {}
)

Madeleines.Actions.apiError = new Hippodrome.Action(
  'api Error',
  (response, status) -> {response: response, status: status}
)
