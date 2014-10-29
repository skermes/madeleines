{button} = React.DOM

Button = React.createClass
  displayName: 'Button'
  render: ->
    bprops =
      className: "button #{@props.className}"
      onClick: @onClick
      disabled: @props.disabled

    button bprops, @props.children

  onClick: (event) ->
    if @props.onClick
      @props.onClick(event)

    if @props.action
      @props.action.apply(null, @props.args)

Madeleines.Components.Button = Button
