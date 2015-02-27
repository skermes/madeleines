{div} = React.DOM

BakingStatusMessage = React.createClass
  displayName: 'Baking Status Message'
  render: ->
    if @props.successful
      message = 'Saved'
      klass = 'status-message-successful'
    else
      # For now, assume that we can only have one reason that a save failed.
      reason = @props.reasons[0]
      if reason == 'bad_url'
        message = 'We couldn\'t fetch that link.  Check your spelling?'
      else if reason == 'http_error'
        message = 'Something went wrong fetching that link.  Try again?'
      else if reason == 'unknown_content_type'
        message = 'Madeleines can only handle text content right now, sorry.'
      else
        message = 'We don\'t know why, but that didn\'t work.  Try again?'
      klass = 'status-message-failed'

    div {className: klass}, message


Madeleines.Components.BakingStatusMessage = BakingStatusMessage
