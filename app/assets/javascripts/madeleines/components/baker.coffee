{div} = React.DOM

Baker = React.createClass
  displayName: 'Baker'
  render: ->
    div {className: 'baker'}, 'Baker'

Madeleines.Components.Baker = Baker
