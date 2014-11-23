{div, img} = React.DOM

HowTo = React.createClass
  displayName: 'How To'
  render: ->
    {Picture} = Madeleines.Components

    div {className: 'how-to'},
      div({className: 'title'}, 'Madeleines is anti-bookmarking')
      div({className: 'paragraph'}, 'You can save all the links you want, but
        there\'s no tagging, or curation, or poring over your hoard late at
        night in search of a link you can\'t quite remember but know must be
        there.  You only get to see one link a day, randomly chosen from
        everything you\'ve saved up until then.  When you log in to Madeleines,
        that\'s all you get:')
      Picture({className: 'screenshot', src: '/images/todays-remembrance.png'})
      div({className: 'paragraph'}, 'If you don\'t like your link for the day,
        you can drop it with the button at the bottom.  You won\'t get a new
        link, but you\'ll never see that one again.')
      Picture({className: 'screenshot', src: '/images/drop-it.png'})
      div({className: 'paragraph'}, 'When you drop a link, the button changes
        to \'Pick It Up\', in case that was an accident.  Pick a link back up,
        and it\'ll stay in the rotation for another day.')
      Picture({className: 'screenshot', src: '/images/pick-it-up.png'})
      div({className: 'paragraph'}, 'Hit the \'Bake\' button on top to save a
        new link.  Just drop a link into the text box and hit the button.  That
        link will go into the pool with all your other saved links to be your
        day\'s link in the future.')
      Picture({className: 'screenshot', src: '/images/baker.png'})
      div({className: 'paragraph'}, 'And that\'s it.  One link a day.')
      div({className: 'title'}, 'In the future, maybe')
      div({className: 'paragraph'}, 'Daily notifications (email? sms?),
        browser addons, support for non-text content, native apps, rainbows,
        unicorns, free kittens.')

Madeleines.Components.HowTo = HowTo
