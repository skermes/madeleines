{viewBaker} = Madeleines.Actions
{div, span} = React.DOM

TopBar = React.createClass
  displayName: 'Top Bar'
  render: ->
    {Button} = Madeleines.Components

    div {className: 'top-bar'},
      span({className: 'title'}, 'Madeleines'),
      Button({className: 'bake-button', action: viewBaker}, 'Bake')

Madeleines.Components.TopBar = TopBar
