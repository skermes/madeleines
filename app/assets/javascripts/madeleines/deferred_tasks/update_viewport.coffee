UpdateViewport = Hippodrome.createDeferredTask
  displayName: 'Update Viewport'
  initialize: (options) ->
    window.onresize = @updateViewportInfo
    @updateViewportInfo()

  updateViewportInfo: ->
    {innerWidth, innerHeight, devicePixelRatio} = window
    Madeleines.Actions.viewportInfo(innerWidth, innerHeight, devicePixelRatio)

Madeleines.Tasks.UpdateViewport = UpdateViewport
