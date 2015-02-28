{div, input, form} = React.DOM

NotificationsForm = React.createClass
  displayName: 'Notifications Form'

  getInitialState: ->
    return {
      notifications: if @props.settings then @props.settings.notifications else false
    }

  componentWillReceiveProps: (newProps) ->
    if newProps.settings
      @setState(notifications: newProps.settings.notifications)

  render: ->
    {RadioButton} = Madeleines.Components

    yesPrompt = 'Yes, I want to get daily notifications'
    if @props.settings
      yesPrompt = "#{yesPrompt} at #{@props.settings.email}"

    disable = @props.pending and
              @props.networkAction == Madeleines.Actions.updateSettings

    buttonText = 'Save'
    if disable
      buttonText = 'Saving...'

    form {onSubmit: @updateSettings},
      div({className: 'section-heading'}, 'Notifications')
      RadioButton({
        name: 'notifications'
        value: 'yes'
        onChange: @notificationsYes
        checked: @state.notifications
      }, yesPrompt)
      RadioButton({
        name: 'notification'
        value: 'no'
        onChange: @notificationsNo
        checked: !@state.notifications
      }, 'No, don\'t send me any notifications')
      input({
        type: 'submit'
        className: 'button'
        value: buttonText
        disabled: disable
      })

  notificationsYes: ->
    @setState(notifications: true)
  notificationsNo: ->
    @setState(notifications: false)

  updateSettings: (event) ->
    event.preventDefault()
    newSettings =_.merge(_.clone(@props.settings),
                         {notifications: @state.notifications})
    Madeleines.Actions.updateSettings(newSettings)

Madeleines.Components.NotificationsForm = NotificationsForm
