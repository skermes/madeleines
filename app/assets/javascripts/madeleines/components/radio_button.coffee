{label, input} = React.DOM

RadioButton = React.createClass
  displayName: 'Radio Button'
  render: ->
    {Icon} = Madeleines.Components

    check = if @props.checked then Icon({name: 'check', className: 'check'}) else undefined

    label({className: 'radio-input'},
      input({
        type: 'radio'
        name: @props.name
        value: @props.value
        checked: !!@props.checked
        onChange: @props.onChange
      })
      check
      @props.children)

Madeleines.Components.RadioButton = RadioButton
