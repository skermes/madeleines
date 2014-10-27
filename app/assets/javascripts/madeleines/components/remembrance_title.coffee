{div, a} = React.DOM

RemembranceTitle = React.createClass
  displayName: 'Remembrance Title'
  render: ->
    if @props.remembrance.title and @props.remembrance.title.trim().length > 0
      title = @props.remembrance.title
    else
      title = @props.remembrance.url

    div {className: 'remembrance-title'},
      a {href: @props.remembrance.url}, title

Madeleines.Components.RemembranceTitle = RemembranceTitle
