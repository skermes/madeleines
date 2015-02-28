{div, label, input, form} = React.DOM

PasswordForm = React.createClass
  displayName: 'Password Form'

  getInitialState: ->
    return {
      oldPassword: ''
      newPassword: ''
    }

  render: ->
    disable = @props.pending and
              @props.networkAction == Madeleines.Actions.changePassword

    buttonText = 'Change Password'
    if disable
      buttonText = 'Changing Password...'

    form {onSubmit: @changePassword},
      div({className: 'section-heading'}, 'Password')
      label({htmlFor: 'old-password'}, 'Old Password')
      input({
        type: 'password'
        id: 'old-password'
        value: @state.oldPassword
        onChange: @changeOld
      })
      label({htmlFor: 'new-password'}, 'New Password')
      input({
        type: 'password'
        id: 'new-password'
        value: @state.newPassword
        onChange: @changeNew
      })
      input({
        type: 'submit'
        className: 'button'
        value: buttonText
        disabled: disable
      })

  changeOld: (event) ->
    @setState(oldPassword: event.target.value)
  changeNew: (event) ->
    @setState(newPassword: event.target.value)

  changePassword: (event) ->
    event.preventDefault()
    Madeleines.Actions.changePassword(@state.oldPassword, @state.newPassword)

Madeleines.Components.PasswordForm = PasswordForm
