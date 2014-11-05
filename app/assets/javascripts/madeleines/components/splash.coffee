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
      div({className: 'hero'},
        HeroLine({}, 'Bookmarking')
        HeroLine({}, 'lets you')
        HeroLine({}, 'forget')
        div({className: 'hero-line-pop'}, 'M a d e l e i n e s')
        HeroLine({}, 'helps you')
        HeroLine({}, 'remember'))
      div({className: 'splash-section'}, 'If you\'re anything like me, you\'ve
        squirreled away piles and piles of digital errata.  Whether it\'s a
        bookmarking service or old blog posts or whatever, you saved it because
        you thought it was valuable, and now it\'s out in the ether, gathering
        dust.')
      div({className: 'splash-section'}, 'Madeleines is the answer I ginned up
        to this (admittedly, rather bourgeois) problem.  You can save as many
        links as you want in Madeleines, but you\'ll only get one back each
        day.  Madeleines chooses one link at random - there\'s no analytics or
        machine learning or fancy predictive tech.  It\'s the computer
        equivalent of a blindfold and a handful of darts.')
      div({className: 'splash-section'}, 'If you don\'t like a day\'s link you
        can tell the system to never give it back to you again, but you still
        won\'t get another one until the next day.  Even at just one link a day,
        I\'ve been pleasantly surprised at how often a day\'s link is
        serendipitously relevant to what I\'m working on or thinking about.
        Turns out that when I think I want to remember something later, I\'m
        usually right.')
      div({className: 'splash-section'}, 'Make an account by logging in above,
        and start remembering instead of forgetting.')


Madeleines.Components.Splash = Splash
