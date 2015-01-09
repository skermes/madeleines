{LoginFailed} = Madeleines.Stores
{div, input, label, form} = React.DOM

LogInForm = React.createClass
  displayName: 'Log In Form'
  mixins: [
    LoginFailed.listen('loginFailed', LoginFailed.hasFailed)
  ]
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
      if @state.loginFailed
        message = div({className: 'login-fail-message'}, 'Wrong username or password')

      div {className: 'login-form'},
        form({onSubmit: @login},
          label({htmlFor: 'login-email'}, 'Email'),
          input({type: 'email', id: 'login-email', ref: 'emailInput', onChange: @emailChange, value: @state.email}),
          label({htmlFor: 'login-password'}, 'Password'),
          input({type: 'password', id: 'login-password', onChange: @passwordChange, value: @state.password})
          input({type: 'submit', className: 'button', value: 'Log In'})),
        message
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
