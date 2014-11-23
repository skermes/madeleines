UpdateViewport = new Hippodrome.DeferredTask
  displayName: 'Update Viewport'
  action: Madeleines.Actions.startApp
  task: (payload) ->
    window.onresize = @updateViewportInfo
    @updateViewportInfo()

  updateViewportInfo: ->
    {innerWidth, innerHeight, devicePixelRatio} = window
    Madeleines.Actions.viewportInfo(innerWidth, innerHeight, devicePixelRatio)

Madeleines.Tasks.UpdateViewport = UpdateViewport
