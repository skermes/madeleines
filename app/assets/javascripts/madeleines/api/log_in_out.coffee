LogInOut = {
  login: Madeleines.Api.post(-> "#{Madeleines.Api.apiPrefix}/login")
  logout: Madeleines.Api.post(-> "#{Madeleines.Api.apiPrefix}/logout")
}

Madeleines.Api.LogInOut = LogInOut
