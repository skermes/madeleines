{div, input, label, form} = React.DOM

LogInForm = React.createClass
  displayName: 'Log In Form'
  getInitialState: ->
    return {
      open: false
    }
  componentDidUpdate: (prevProps, prevState) ->
    if @state.open
      @refs.emailInput.getDOMNode().focus()
  render: ->
    {Button} = Madeleines.Components

    if @state.open
      form {className: 'login-form'},
        label({for: 'login-email'}, 'Email'),
        input({type: 'email', id: 'login-email', ref: 'emailInput'}),
        label({form: 'login-password'}, 'Password'),
        input({type: 'password', id: 'login-password'})
        input({type: 'submit', className: 'button', value: 'Log In'})
    else
      Button({className: 'login-button', onClick: @openForm}, 'Log In')

  openForm: ->
    @setState(open: true)

Madeleines.Components.LogInForm = LogInForm
