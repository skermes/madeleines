{div, a} = React.DOM

RemembranceTitle = React.createClass
  displayName: 'Remembrance Title'
  render: ->
    div {className: 'remembrance-title'},
      a {href: @props.remembrance.url}, @props.remembrance.title

Madeleines.Components.RemembranceTitle = RemembranceTitle
