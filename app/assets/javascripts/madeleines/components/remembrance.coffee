{TodaysRemembrance} = Madeleines.Stores
{div} = React.DOM

Remembrance = React.createClass
  displayName: 'Remembrance'

  mixins: [
    TodaysRemembrance.listen('remembranceChange')
  ]

  getInitialState: ->
    return {
      remembrance: TodaysRemembrance.remembrance()
    }

  remembranceChange: ->
    @setState({remembrance: TodaysRemembrance.remembrance()})

  render: ->
    {RemembranceTitle, RemembrancePreview} = Madeleines.Components

    if not @state.remembrance
      return div {className: 'waiting-for-remembrance'}, 'Waiting'

    div {className: 'remembrance'},
      RemembranceTitle({remembrance: @state.remembrance}),
      RemembrancePreview({remembrance: @state.remembrance})

Madeleines.Components.Remembrance = Remembrance
