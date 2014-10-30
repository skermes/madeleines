{div, input, label, form} = React.DOM

LogInForm = React.createClass
  displayName: 'Log In Form'
  getInitialState: ->
    return {
      open: false
      email: ''
      password: ''
    }
  componentDidUpdate: (prevProps, prevState) ->
    if @state.open and not prevState.open
      @refs.emailInput.getDOMNode().focus()
  render: ->
    {Button} = Madeleines.Components

    if @state.open
      form {className: 'login-form', onSubmit: @login},
        label({htmlFor: 'login-email'}, 'Email'),
        input({type: 'email', id: 'login-email', ref: 'emailInput', onChange: @emailChange, value: @state.email}),
        label({htmlFor: 'login-password'}, 'Password'),
        input({type: 'password', id: 'login-password', onChange: @passwordChange, value: @state.password})
        input({type: 'submit', className: 'button', value: 'Log In'})
    else
      Button({className: 'login-button', onClick: @openForm}, 'Log In')

  openForm: ->
    @setState(open: true)
  emailChange: (event) ->
    @setState(email: event.target.value)
  passwordChange: (event) ->
    @setState(password: event.target.value)
  login: (event) ->
    event.preventDefault()
    Madeleines.Actions.login(@state.email, @state.password)

Madeleines.Components.LogInForm = LogInForm
