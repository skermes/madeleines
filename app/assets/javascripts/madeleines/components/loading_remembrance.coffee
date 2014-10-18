{div} = React.DOM

LoadingRemembrance = React.createClass
  displayName: 'Loading Remembrance'
  render: ->
    div {className: 'loading-remembrance'},
      div({className: 'orb-1'})
      div({className: 'orb-2'})

Madeleines.Components.LoadingRemembrance = LoadingRemembrance
