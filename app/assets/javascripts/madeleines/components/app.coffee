{TodaysRemembrance} = Madeleines.Stores
{div} = React.DOM

App = React.createClass
  displayName: 'App'
  mixins: [
    TodaysRemembrance.listen('onRemembranceChange')
  ]
  getInitialState: ->
    return {
      remembrance: TodaysRemembrance.remembrance()
    }
  onRemembranceChange: ->
    @setState({remembrance: TodaysRemembrance.remembrance()})

  render: ->
    {TopBar,
     Remembrance,
     DropRemembrance} = Madeleines.Components

    if @state.remembrance
      drop = DropRemembrance({remembrance: @state.remembrance})
    else
      drop = undefined

    div {className: 'madeleines'},
      TopBar(),
      Remembrance({remembrance: @state.remembrance}),
      drop

Madeleines.Components.App = App
