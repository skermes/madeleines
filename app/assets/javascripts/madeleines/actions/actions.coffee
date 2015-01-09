#= require_self
#= require_tree .

Madeleines.Actions = {}

Madeleines.Actions.login = Hippodrome.createAction
  displayName: 'log In'
  build: (email, password) -> {email: email, password: password}

Madeleines.Actions.loginFailed = Hippodrome.createAction
  displayName: 'log In Failed'
  build: -> {}

Madeleines.Actions.logout = Hippodrome.createAction
  displayName: 'log Out'
  build: -> {}

Madeleines.Actions.updateUser = Hippodrome.createAction
  displayName: 'update User'
  build: (userId) -> {userId: userId}

Madeleines.Actions.viewIndex = Hippodrome.createAction
  displayName: 'view Index'
  build: -> {}

Madeleines.Actions.viewBaker = Hippodrome.createAction
  displayName: 'view Baker'
  build: -> {}

Madeleines.Actions.view404 = Hippodrome.createAction
  displayName: 'view 404'
  build: -> {}

Madeleines.Actions.viewHowTo = Hippodrome.createAction
  displayName: 'view How To'
  build: -> {}

Madeleines.Actions.apiError = Hippodrome.createAction
  displayName: 'api Error'
  build: (response, status) -> {response: response, status: status}

Madeleines.Actions.viewportInfo = Hippodrome.createAction
  displayName: 'viewport Info'
  build: (width, height, density) ->
    width: width
    height: height
    density: density
