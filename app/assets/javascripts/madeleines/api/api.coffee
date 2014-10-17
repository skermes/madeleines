#= require_self
#= require_tree .

Api = {
  apiPrefix: "/api/v1"
  post: (urlFn) ->
    (data, urlArgs..., success, error) ->
      urlArgs.splice(0, 0, data)
      url = urlFn.apply(null, urlArgs)
      Madeleines.Http.post(url, data, success, error)

  get: (urlFn) ->
    (urlArgs..., success, error) ->
      url = urlFn.apply(null, urlArgs)
      Madeleines.Http.get(url, success, error)
}

Madeleines.Api = Api
