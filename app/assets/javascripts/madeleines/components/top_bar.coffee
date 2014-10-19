{div, span, button} = React.DOM

TopBar = React.createClass
  displayName: 'Top Bar'
  render: ->
    div {className: 'top-bar'},
      span({className: 'title'}, 'Madeleines'),
      button({className: 'button bake-button'}, 'Bake')

Madeleines.Components.TopBar = TopBar
