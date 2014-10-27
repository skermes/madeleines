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
