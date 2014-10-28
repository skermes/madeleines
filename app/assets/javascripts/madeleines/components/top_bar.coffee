{viewBaker, viewIndex} = Madeleines.Actions
{div, span} = React.DOM

TopBar = React.createClass
  displayName: 'Top Bar'
  render: ->
    {Button} = Madeleines.Components

    if @props.currentPage in ['none', 'bake', '404']
      action = viewIndex
      text = 'Today\'s'
    else
      action = viewBaker
      text = 'Bake'

    div {className: 'top-bar'},
      span({className: 'title'}, 'Madeleines'),
      Button({className: 'change-page-button', action: action}, text)

Madeleines.Components.TopBar = TopBar
