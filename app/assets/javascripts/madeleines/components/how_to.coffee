{div} = React.DOM

HowTo = React.createClass
  displayName: 'How To'
  render: ->
    div {className: 'how-to'}, 'How to use Madeleines.'

Madeleines.Components.HowTo = HowTo
