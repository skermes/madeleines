{TodaysRemembrance, DropPickUpStatus} = Madeleines.Stores
{div} = React.DOM

Remembrance = React.createClass
  displayName: 'Remembrance'
  mixins: [
    TodaysRemembrance.listen('onRemembranceChange')
    DropPickUpStatus.listen('onDropPickupChange')
  ]
  getInitialState: ->
    return {
      remembrance: TodaysRemembrance.remembrance()
      remembrancePending: TodaysRemembrance.pending()
      dropPickupPending: DropPickUpStatus.isPending()
    }
  onRemembranceChange: ->
    @setState({
      remembrance: TodaysRemembrance.remembrance()
      remembrancePending: TodaysRemembrance.pending()
    })
  onDropPickupChange: ->
    @setState(dropPickupPending: DropPickUpStatus.isPending())

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
