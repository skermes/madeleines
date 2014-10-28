{div} = React.DOM

FourOhFour = React.createClass
  displayName: '404'
  render: ->
    div {className: 'four-oh-four'}, 'Oh no 404'

Madeleines.Components.FourOhFour = FourOhFour
