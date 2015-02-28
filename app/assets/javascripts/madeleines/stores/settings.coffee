Settings = Hippodrome.createStore
  displayName: 'Settings Store'
  initialize: (options) ->
    @_settings = undefined

    @dispatch(Madeleines.Actions.updateSettings).to(@updateSettings)
    @dispatch(Madeleines.Actions.applySettings).to(@updateSettings)

  updateSettings: (payload) ->
    @_settings = payload.settings
    @trigger()

  public:
    settings: -> @_settings

Madeleines.Stores.Settings = Settings
