{div} = React.DOM

Splash = React.createClass
  displayName: 'Splash'
  render: ->
    div {className: 'splash'}, 'Oh hello you'

Madeleines.Components.Splash = Splash
