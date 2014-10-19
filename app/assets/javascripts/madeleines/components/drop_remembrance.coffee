{div, button} = React.DOM

DropRemembrance = React.createClass
  displayName: 'Drop Remembrance'
  render: ->
    if @props.remembrance.is_dropped
      message = 'Actually, bring it back'
      verb = 'Pick It Up'
    else
      message = 'Don\'t want this link?'
      verb = 'Drop It'

    if @props.pending
      verb = 'Saving...'

    div {className: 'drop-remembrance'},
      message,
      button {
        className: 'button drop-remembrance-button',
        onClick: @onClick,
        disabled: @props.pending
        }, verb

  onClick: ->
    if @props.remembrance.is_dropped
      Madeleines.Actions.pickUpRemembrance()
    else
      Madeleines.Actions.dropRemembrance()

Madeleines.Components.DropRemembrance = DropRemembrance
