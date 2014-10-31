{Router, CurrentUser} = Madeleines.Stores
{div} = React.DOM

App = React.createClass
  displayName: 'App'
  mixins: [
    Router.listen('onPageChange')
    CurrentUser.listen('onUserChange')
  ]
  getInitialState: ->
    return {
      page: Router.appPage()
      userId: CurrentUser.id()
    }
  onPageChange: ->
    @setState(page: Router.appPage())
  onUserChange: ->
    @setState(userId: CurrentUser.id())

  render: ->
    {TopBar, Remembrance, Baker, FourOhFour, Splash,
     HowTo} = Madeleines.Components

    includeTopBar = true
    if @state.userId == undefined
      contents = Splash()
      includeTopBar = false
    else if @state.page == 'none'
      # Before we've gotten the first view* action from the url task, we can
      # either show 404 or nothing.  I prefer nothing.
      contents = undefined
    else if @state.page == 'index'
      contents = Remembrance()
    else if @state.page == 'bake'
      contents = Baker()
    else if @state.page == 'howto'
      contents = HowTo()
      includeTopBar = false
    else if @state.page == '404'
      contents = FourOhFour()

    div {className: 'madeleines'},
      if includeTopBar then TopBar({currentPage: @state.page}) else undefined,
      contents

Madeleines.Components.App = App
