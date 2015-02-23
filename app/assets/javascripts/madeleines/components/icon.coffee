{span} = React.DOM

aliases = {
  'cog': 'cog'
  'gear': 'cog'
  'help': 'help'
  'question mark': 'help'
}

Icon = React.createClass
  displayName: 'Icon'
  render: ->
    name = aliases[@props.name]
    svg = Madeleines.Entypo[name]

    span({
      className: "icon"
      dangerouslySetInnerHTML: {__html: svg}
    })

Madeleines.Components.Icon = Icon
