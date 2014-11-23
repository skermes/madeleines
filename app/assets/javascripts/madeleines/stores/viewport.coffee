Viewport = new Hippodrome.Store
  displayName: 'Viewport'
  initialize: ->
    @_width = 0
    @_height = 0
    @_density = 0
  dispatches: [{
    action: Madeleines.Actions.viewportInfo
    callback: 'changeViewport'
  }]

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
