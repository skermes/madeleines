#= require_self
#= require ./http/http
#= require ./api/api
#= require ./actions/actions
#= require ./stores/stores
#= require ./deferred_tasks/deferred_tasks
#= require ./components/components

window.Madeleines = {}

Madeleines.start = (root, userId) ->
  React.renderComponent(Madeleines.Components.App(), root)
  Madeleines.Actions.startApp(userId)
