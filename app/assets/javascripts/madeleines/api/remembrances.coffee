Remembrances = {
  bite: Madeleines.Api.get(-> "#{Madeleines.Api.apiPrefix}/bite")
  drop: Madeleines.Api.post(-> "#{Madeleines.Api.apiPrefix}/drop")
  pickUp: Madeleines.Api.post(-> "#{Madeleines.Api.apiPrefix}/pick-up")
}

Madeleines.Api.Remembrances = Remembrances
