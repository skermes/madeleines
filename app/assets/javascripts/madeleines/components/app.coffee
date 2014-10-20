{div} = React.DOM

App = React.createClass
  displayName: 'App'
  render: ->
    {TopBar, Remembrance} = Madeleines.Components

    div {className: 'madeleines'},
      TopBar(),
      Remembrance()

Madeleines.Components.App = App
