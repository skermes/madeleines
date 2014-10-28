{div} = React.DOM

Line = React.createClass
  displayName: 'Line'
  render: ->
    div {className: 'line'}, @props.text

FourOhFour = React.createClass
  displayName: '404'
  render: ->
    div {className: 'four-oh-four'},
      Line({text: 'Yesterday upon the stair'})
      Line({text: 'I saw a page that wasn\'t there'})
      Line({text: 'It wasn\'t there again today'})
      Line({text: 'I wish that page would go away'})
      div({className: 'apology'}, 'with apologies to Hughes Mearns')

Madeleines.Components.FourOhFour = FourOhFour
