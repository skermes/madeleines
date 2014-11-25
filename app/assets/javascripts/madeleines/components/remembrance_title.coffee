{div, a} = React.DOM

RemembranceTitle = React.createClass
  displayName: 'Remembrance Title'
  render: ->
    if @props.remembrance.title and @props.remembrance.title.trim().length > 0
      title = @props.remembrance.title
    else
      title = @props.remembrance.url

    if /:\/\//g.test(@props.remembrance.url)
      url = @props.remembrance.url
    else
      url = "http://#{@props.remembrance.url}"

    div {className: 'remembrance-title'},
      a {href: url}, title

Madeleines.Components.RemembranceTitle = RemembranceTitle
