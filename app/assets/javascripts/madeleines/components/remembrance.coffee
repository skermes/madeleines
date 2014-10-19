{div} = React.DOM

Remembrance = React.createClass
  displayName: 'Remembrance'

  render: ->
    {LoadingRemembrance
     RemembranceTitle,
     RemembrancePreview,
     DropRemembrance} = Madeleines.Components

    if not @props.remembrance
      return LoadingRemembrance()

    div {className: 'remembrance'},
      RemembranceTitle({remembrance: @props.remembrance}),
      RemembrancePreview({remembrance: @props.remembrance}),
      DropRemembrance({remembrance: @props.remembrance})

Madeleines.Components.Remembrance = Remembrance
