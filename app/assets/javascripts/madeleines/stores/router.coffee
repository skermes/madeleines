Router = new Hippodrome.Store
  initialize: ->
    @_route = 'none'

  dispatches: [{
    action: Madeleines.Actions.viewIndex
    callback: 'viewIndex'
  },{
    action: Madeleines.Actions.viewBaker
    callback: 'viewBaker'
  },{
    action: Madeleines.Actions.view404
    callback: 'view404'
  },{
    action: Madeleines.Actions.viewHowTo
    callback: 'viewHowTo'
  }]

  viewIndex: (payload) ->
    @_route = 'index'
    @trigger()
  viewBaker: (payload) ->
    @_route = 'bake'
    @trigger()
  view404: (payload) ->
    @_route = '404'
    @trigger()
  viewHowTo: (payload) ->
    @_route = 'howto'
    @trigger()

  public:
    appPage: -> @_route

Madeleines.Stores.Router = Router
