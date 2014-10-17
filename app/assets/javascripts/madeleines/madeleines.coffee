#= require_self
#= require ./http/http
#= require ./api/api
#= require ./actions/actions
#= require ./stores/stores
#= require ./side_effects/side_effects
#= require ./components/components

window.Madeleines = {}

Madeleines.start = (root) ->
  React.renderComponent(Madeleines.Components.App(), root)
  Madeleines.Actions.startApp()
