{button} = React.DOM

Button = React.createClass
  displayName: 'Button'
  render: ->
    bprops =
      className: "button #{@props.className}"
      onClick: @onClick
      disabled: @props.disabled

    button bprops, @props.children

  onClick: ->
    if @props.action
      @props.action.apply(null, @props.args)

Madeleines.Components.Button = Button
