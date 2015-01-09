{TodaysRemembrance, DropPickUpStatus} = Madeleines.Stores
{div} = React.DOM

Remembrance = React.createClass
  displayName: 'Remembrance'
  mixins: [
    TodaysRemembrance.listenWith('onRemembranceChange')
    DropPickUpStatus.listen('dropPickupPending', DropPickUpStatus.isPending)
  ]

  onRemembranceChange: ->
    return {
      remembrance: TodaysRemembrance.remembrance()
      remembrancePending: TodaysRemembrance.pending()
    }

  render: ->
    {LoadingRemembrance
     RemembranceTitle,
     RemembrancePreview,
     DropRemembrance,
     NoRemembrances} = Madeleines.Components

    if @state.remembrancePending
      return LoadingRemembrance()

    if not @state.remembrance
      return NoRemembrances()

    div {className: 'remembrance'},
      RemembranceTitle({remembrance: @state.remembrance}),
      RemembrancePreview({remembrance: @state.remembrance})
      DropRemembrance({remembrance: @state.remembrance, pending: @state.pending})

Madeleines.Components.Remembrance = Remembrance
