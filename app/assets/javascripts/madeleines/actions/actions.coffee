#= require_self
#= require_tree .

Madeleines.Actions = {}

Madeleines.Actions.startApp = new Hippodrome.Action(
  'start App',
  (userId) -> {userId: userId}
)

Madeleines.Actions.login = new Hippodrome.Action(
  'log In',
  (email, password) -> {email: email, password: password}
)

Madeleines.Actions.loginFailed = new Hippodrome.Action(
  'log In Failed',
  -> {}
)

Madeleines.Actions.logout = new Hippodrome.Action(
  'log Out',
  -> {}
)

Madeleines.Actions.updateUser = new Hippodrome.Action(
  'update User',
  (userId) -> {userId: userId}
)

Madeleines.Actions.viewIndex = new Hippodrome.Action(
  'view Index',
  -> {}
)

Madeleines.Actions.viewBaker = new Hippodrome.Action(
  'view Baker',
  -> {}
)

Madeleines.Actions.view404 = new Hippodrome.Action(
  'view 404',
  -> {}
)

Madeleines.Actions.apiError = new Hippodrome.Action(
  'api Error',
  (response, status) -> {response: response, status: status}
)
