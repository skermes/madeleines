{div} = React.DOM

NoRemembrances = React.createClass
  displayName: 'No Remembrances'
  render: ->
    div {className: 'no-remembrances'},
      div {className: 'message'},
       'It looks like you\'ve dropped all the things you wanted to remember.
        Maybe you should bake some more stuff?'

Madeleines.Components.NoRemembrances = NoRemembrances
