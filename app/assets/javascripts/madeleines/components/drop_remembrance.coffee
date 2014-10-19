{div, button} = React.DOM

DropRemembrance = React.createClass
  displayName: 'Drop Remembrance'
  render: ->
    div {className: 'drop-remembrance'},
      'Don\'t want this link?',
      button {className: 'button drop-remembrance-button'}, 'Drop It'

Madeleines.Components.DropRemembrance = DropRemembrance
