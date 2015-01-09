Viewport = Hippodrome.createStore
  displayName: 'Viewport'
  initialize: ->
    @_width = 0
    @_height = 0
    @_density = 0

    @dispatch(Madeleines.Actions.viewportInfo).to(@changeViewport)

  changeViewport: (payload) ->
    @_width = payload.width
    @_height = payload.height
    @_density = payload.density
    @trigger()

  public:
    device: ->
      if @_width < 700
        'phone'
      else if @_width < 1200
        'tablet'
      else
        'desktop'

Madeleines.Stores.Viewport = Viewport
