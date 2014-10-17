{div} = React.DOM

TopBar = React.createClass
  displayName: 'Top Bar'
  render: ->
    div {className: 'top-bar'}, 'Madeleines'

Madeleines.Components.TopBar = TopBar
