ChangeUrl = new Hippodrome.DeferredTask
  displayName: 'Change Url'
  dispatches: [{
    action: Madeleines.Actions.startApp
    callback: 'setupPopstate'
  },{
    action: Madeleines.Actions.viewIndex
    callback: 'viewIndex'
  },{
    action: Madeleines.Actions.viewBaker
    callback: 'viewBaker'
  }]

  # Note that window.history.pushState doesn't trigger a window.onpopstate
  # event, so we won't get into a infinite loop here.
  setupPopstate: (payload) ->
    viewPageBasedOnUrl = ->
      paths = window.location.pathname.substring(1).split('/')
      if paths[0] == ''
        Madeleines.Actions.viewIndex()
      else if paths[0] == 'bake'
        Madeleines.Actions.viewBaker()
      else if paths[0] == 'howto'
        Madeleines.Actions.viewHowTo()
      else
        Madeleines.Actions.view404()

    window.onpopstate = viewPageBasedOnUrl
    viewPageBasedOnUrl()

  viewIndex: (payload) ->
    window.history.pushState(null, '', '/')
  viewBaker: (payload) ->
    window.history.pushState(null, '', '/bake')

Madeleines.Tasks.ChangeUrl = ChangeUrl
