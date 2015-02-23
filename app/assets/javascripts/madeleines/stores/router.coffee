Router = Hippodrome.createStore
  initialize: ->
    @_route = 'none'

    @dispatch(Madeleines.Actions.viewIndex).to(@viewIndex)
    @dispatch(Madeleines.Actions.viewBaker).to(@viewBaker)
    @dispatch(Madeleines.Actions.view404).to(@view404)
    @dispatch(Madeleines.Actions.viewHowTo).to(@viewHowTo)
    @dispatch(Madeleines.Actions.viewSettings).to(@viewSettings)

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
  viewSettings: (payload) ->
    @_route = 'settings'
    @trigger()

  public:
    appPage: -> @_route

Madeleines.Stores.Router = Router
