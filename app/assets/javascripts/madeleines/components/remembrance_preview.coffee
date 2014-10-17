{div} = React.DOM

RemembrancePreview = React.createClass
  displayName: 'Remembrance Preview'
  render: ->
    div {className: 'remembrance-preview'}, @props.remembrance.preview

Madeleines.Components.RemembrancePreview = RemembrancePreview
