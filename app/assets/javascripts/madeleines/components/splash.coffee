{div, span} = React.DOM

HeroLine = React.createClass
  displayName: 'Hero Line'
  render: ->
    text = @props.children
    text = text.replace(/./g, (c) -> if c == ' ' then '&nbsp; ' else c + ' ')
    text = text.trim()

    div {className: 'hero-line-normal', dangerouslySetInnerHTML: {__html: text}}

Splash = React.createClass
  displayName: 'Splash'
  render: ->
    {LogInForm} = Madeleines.Components

    div {className: 'splash'},
      LogInForm()
      div {className: 'hero'},
        HeroLine({}, 'Bookmarking')
        HeroLine({}, 'lets you')
        HeroLine({}, 'forget')
        div({className: 'hero-line-pop'}, 'M a d e l e i n e s')
        HeroLine({}, 'helps you')
        HeroLine({}, 'remember')

Madeleines.Components.Splash = Splash
