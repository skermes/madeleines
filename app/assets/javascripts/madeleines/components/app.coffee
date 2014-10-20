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
    {TopBar, Remembrance, Baker} = Madeleines.Components

    if @state.page == 'home'
      contents = Remembrance()
    else if @state.page == 'baker'
      contents = Baker()

    div {className: 'madeleines'},
      TopBar(),
      contents

Madeleines.Components.App = App
