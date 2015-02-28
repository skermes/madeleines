#= require ./network_task

ChangeSettings = Madeleines.Tasks.makeNetworkTask(
  Madeleines.Actions.updateSettings,
  Madeleines.Api.Settings.changeSettings,
  (payload) -> {settings: payload.settings})
