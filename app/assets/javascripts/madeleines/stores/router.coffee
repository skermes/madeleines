Router = new Hippodrome.Store
  initialize: ->
    @_route = ''

  dispatches: [{
    action: Madeleines.Actions.viewBaker
    callback: 'viewBaker'
  }]

  viewBaker: (payload) ->
    @_route = 'bake'
    @trigger()

  public:
    appPage: ->
      pages =
        '': 'home'
        'bake': 'baker'
      pages[@_route]

Madeleines.Stores.Router = Router
