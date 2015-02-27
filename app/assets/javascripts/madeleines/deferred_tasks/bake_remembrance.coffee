#= require ./network_task

BakeRemembrance = Madeleines.Tasks.makeNetworkTask(
  Madeleines.Actions.bake,
  Madeleines.Api.Remembrances.bake,
  (payload) -> {url: payload.url.trim()})

Madeleines.Tasks.BakeRemembrance = BakeRemembrance
