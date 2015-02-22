{Viewport} = Madeleines.Stores
{img} = React.DOM

# Listen to store manually to work around Hippodrome bug.

Picture = React.createClass
  displayName: 'Picture'

  getInitialState: ->
    return {
      device: Viewport.device()
    }
  componentDidMount: ->
    Viewport.register(@viewportChange)
  componentWillUnmount: ->
    Viewport.unregister(@viewportChange)
  viewportChange: ->
    @setState(device: Viewport.device())

  render: ->
    [path, extension] = @props.src.split('.')
    src = "#{path}-#{@state.device}.#{extension}"

    props = _.assign({}, @props)
    props.src = Madeleines.Images[src]

    img(props)


Madeleines.Components.Picture = Picture
