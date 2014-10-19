{div, button} = React.DOM

DropRemembrance = React.createClass
  displayName: 'Drop Remembrance'
  render: ->
    div {className: 'drop-remembrance'},
      'This link no good? Don\'t want it anymore? Go ahead and',
      button {className: 'drop-remembrance-button'}, 'Drop It'

Madeleines.Components.DropRemembrance = DropRemembrance
