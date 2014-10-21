Madeleines.Actions = {}

Madeleines.Actions.startApp = new Hippodrome.Action(
  'start App',
  -> {}
)

Madeleines.Actions.viewBaker = new Hippodrome.Action(
  'view Baker',
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

Madeleines.Actions.bake = new Hippodrome.Action(
  'bake',
  (text) -> {url: text}
)

Madeleines.Actions.bakingSuccessful = new Hippodrome.Action(
  'baking Successful',
  () -> {}
)

Madeleines.Actions.bakingFailed = new Hippodrome.Action(
  'baking Failed',
  (reasons) -> {reasons: reasons}
)

Madeleines.Actions.apiError = new Hippodrome.Action(
  'api Error',
  (response, status) -> {response: response, status: status}
)
