# Assume there's only one CSRF token.  If there's more than one, we're
# probably more screwed than this script can handle anyway.
authenticityTokenFromDOM = -> document.getElementsByName('csrf-token')[0].content

Http = {
  _authenticityToken: undefined

  request: (method, url, data, success, error) ->
    if not Http._authenticityToken
      Http._authenticityToken = authenticityTokenFromDOM()

    xhr = new XMLHttpRequest()
    xhr.open(method, url)
    xhr.responseType = 'json'
    xhr.setRequestHeader('Accept', 'application/json, text/javascript, */*; q=0.01')
    xhr.setRequestHeader('Content-Type', 'application/json')
    xhr.setRequestHeader('X-CSRF-Token', Http._authenticityToken)

    xhr.onreadystatechange = (xhrEvent) ->
      if xhr.readyState == 4
        response = xhr.response
        if response._authenticity_token
          Http._authenticityToken = response._authenticity_token

        successful = xhr.status < 400
        if successful
          success(response._data)
        else
          error(response._data, xhr.status)

    xhr.send(JSON.stringify(data))

  post: (url, data, success, error) ->
    Http.request('post', url, data, success, error)

  put: (url, data, success, error) ->
    Http.request('put', url, data, success, error)

  get: (url, success, error) ->
    Http.request('get', url, undefined, success, error)
}

Madeleines.Http = Http
