{Router} = Madeleines.Stores
{div} = React.DOM

App = React.createClass
  displayName: 'App'
  mixins: [
    Router.listen('onPageChange')
  ]
  getInitialState: ->
    return {
      page: Router.appPage()
    }
  onPageChange: ->
    @setState(page: Router.appPage())

  render: ->
    {TopBar, Remembrance, Baker, FourOhFour} = Madeleines.Components

    if @state.page == 'none'
      # Before we've gotten the first view* action from the url task, we can
      # either show 404 or nothing.  I prefer nothing.
      contents = undefined
    else if @state.page == 'index'
      contents = Remembrance()
    else if @state.page == 'bake'
      contents = Baker()
    else if @state.page == '404'
      contents = FourOhFour()

    div {className: 'madeleines'},
      TopBar(),
      contents

Madeleines.Components.App = App
