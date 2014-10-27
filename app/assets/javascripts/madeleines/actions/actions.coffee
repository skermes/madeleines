#= require_self
#= require_tree .

Madeleines.Actions = {}

Madeleines.Actions.startApp = new Hippodrome.Action(
  'start App',
  -> {}
)

Madeleines.Actions.viewBaker = new Hippodrome.Action(
  'view Baker',
  -> {}
)

Madeleines.Actions.apiError = new Hippodrome.Action(
  'api Error',
  (response, status) -> {response: response, status: status}
)
