{Viewport} = Madeleines.Stores
{img} = React.DOM

Picture = React.createClass
  displayName: 'Picture'
  mixins: [
    Viewport.listen('updateViewport')
  ]
  getInitialState: ->
    device: Viewport.device()
  updateViewport: ->
    @setState(device: Viewport.device())

  render: ->
    [path, extension] = @props.src.split('.')
    src = "#{path}-#{@state.device}.#{extension}"

    props = _.assign({}, @props)
    props.src = Madeleines.Images[src]

    img(props)


Madeleines.Components.Picture = Picture
