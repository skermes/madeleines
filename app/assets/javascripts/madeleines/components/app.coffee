{TodaysRemembrance, DropPickUpStatus} = Madeleines.Stores
{div} = React.DOM

App = React.createClass
  displayName: 'App'
  mixins: [
    TodaysRemembrance.listen('onRemembranceChange')
    DropPickUpStatus.listen('onDropPickupChange')
  ]
  getInitialState: ->
    return {
      remembrance: TodaysRemembrance.remembrance()
      dropPickUpPending: DropPickUpStatus.isPending()
    }
  onRemembranceChange: ->
    @setState({remembrance: TodaysRemembrance.remembrance()})
  onDropPickupChange: ->
    @setState({dropPickUpPending: DropPickUpStatus.isPending()})

  render: ->
    {TopBar,
     Remembrance,
     DropRemembrance} = Madeleines.Components

    if @state.remembrance
      drop = DropRemembrance({
        remembrance: @state.remembrance
        pending: @state.dropPickUpPending
      })
    else
      drop = undefined

    div {className: 'madeleines'},
      TopBar(),
      Remembrance({remembrance: @state.remembrance}),
      drop

Madeleines.Components.App = App
