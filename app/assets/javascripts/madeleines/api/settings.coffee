Settings = {
  index: Madeleines.Api.get(-> "#{Madeleines.Api.apiPrefix}/settings")
  changePassword: Madeleines.Api.put(-> "#{Madeleines.Api.apiPrefix}/change_password")
  changeSettings: Madeleines.Api.put(-> "#{Madeleines.Api.apiPrefix}/settings")
}

Madeleines.Api.Settings = Settings
