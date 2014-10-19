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
    div {className: 'madeleines'},
      Madeleines.Components.TopBar(),
      Madeleines.Components.Remembrance({remembrance: @state.remembrance})

Madeleines.Components.App = App
