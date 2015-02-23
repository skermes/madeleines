{span} = React.DOM

aliases = {
  'gear': 'cog'
  'question mark': 'help'
}

Icon = React.createClass
  displayName: 'Icon'
  render: ->
    name = aliases[@props.name] || @props.name
    svg = Madeleines.Entypo[name]

    className = 'icon'
    if @props.className
      className += ' ' + @props.className

    span({
      className: className
      dangerouslySetInnerHTML: {__html: svg}
    })

Madeleines.Components.Icon = Icon
