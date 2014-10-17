{div} = React.DOM

App = React.createClass
  displayName: 'App'
  render: ->
    div {className: 'madeleines'},
      Madeleines.Components.TopBar()

Madeleines.Components.App = App
