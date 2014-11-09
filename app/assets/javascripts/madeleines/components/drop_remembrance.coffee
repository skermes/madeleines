{pickUpRemembrance, dropRemembrance} = Madeleines.Actions
{div, span} = React.DOM

DropRemembrance = React.createClass
  displayName: 'Drop Remembrance'
  render: ->
    {Button} = Madeleines.Components

    if @props.remembrance.is_dropped
      message = 'Actually, bring it back'
      verb = 'Pick It Up'
    else
      message = 'Don\'t want this link?'
      verb = 'Drop It'

    if @props.pending
      verb = 'Saving...'

    action = if @props.remembrance.is_dropped then pickUpRemembrance else dropRemembrance

    div {className: 'drop-remembrance'},
      span({className: 'drop-message'}, message),
      Button {
        className: 'drop-remembrance-button',
        action: action,
        disabled: @props.pending
        }, verb

Madeleines.Components.DropRemembrance = DropRemembrance
