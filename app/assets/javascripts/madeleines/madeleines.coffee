#= require_self
#= require ./components/components

window.Madeleines = {}

Madeleines.start = (root) ->
  React.renderComponent(Madeleines.Components.App(), root)
