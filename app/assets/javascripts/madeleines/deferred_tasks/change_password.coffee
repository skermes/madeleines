#= require ./network_task

ChangePassword = Madeleines.Tasks.makeNetworkTask(
  Madeleines.Actions.changePassword,
  Madeleines.Api.Settings.changePassword
  (payload) -> {
    new_password: payload.newPassword,
    old_password: payload.oldPassword})
