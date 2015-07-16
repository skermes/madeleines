{div, span} = React.DOM

HeroLine = React.createClass
  displayName: 'Hero Line'
  render: ->
    text = @props.children
    text = text.replace(/./g, (c) -> if c == ' ' then '&nbsp; ' else c + ' ')
    text = text.trim()

    div {className: 'hero-line-normal', dangerouslySetInnerHTML: {__html: text}}

SplashSection = React.createClass
  displayName: 'Splash Section'
  render: ->
    div {className: 'splash-section ' + @props.className},
      div({className: 'splash-text'}, @props.children)

Splash = React.createClass
  displayName: 'Splash'
  render: ->
    {LogInForm} = Madeleines.Components

    div {className: 'splash'},
      LogInForm()
      div({className: 'hero'},
        div({className: 'tagline-container'},
          HeroLine({}, 'Bookmarking')
          HeroLine({}, 'lets you')
          HeroLine({}, 'forget')
          div({className: 'hero-line-pop'}, 'M a d e l e i n e s')
          HeroLine({}, 'helps you')
          HeroLine({}, 'remember')))
      SplashSection({className: 'graf'}, 'If you\'re anything like me, you\'ve squirreled away more random pieces of digital errata than you care to count.  Bookmarks, blog posts, whatever - you thought it was important enough to save, so you stuck it someplace you could safely forget about it.  Now it\'s floating out there in the ether, gathering dust.')
      SplashSection({className: 'subhead'}, 'Madeleines reminds you of cool things you\'ve forgotten')
      SplashSection({className: 'graf'}, 'Madeleines is anti-bookmarking.  You can save as many links as you want, but you can\'t tag them or curate them or share them with your friends.  Instead, you get a daily reminder of one thing you wanted to save, but then forgot about.  You can mark a day\'s link so it never shows up again, but you still only get one that day.  Madeleines doesn\'t want to take up all your time or attention - it just wants to show you something neat.')
      SplashSection({className: 'subhead'}, 'Don\'t underestimate serendipity')
      SplashSection({className: 'graf'}, 'Madeleines chooses your daily link at random.  There\'s no machine learning or hardcore tech - it\'s basically a blindfold and a handful of darts that can run on a webserver.  Even without that, though, it still often manages to find just the right link for the day.  I\'ve had more than one argument with a friend get settled when Madeleines sent me an article I\'d saved about that very topic.')
      SplashSection({className: 'subhead'}, 'Stop forgetting.  Start remembering.')

Madeleines.Components.Splash = Splash
