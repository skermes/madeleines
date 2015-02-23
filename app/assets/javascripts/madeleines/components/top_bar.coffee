{viewBaker, viewIndex, viewHowTo, viewSettings} = Madeleines.Actions
{div, span} = React.DOM

TopBarButton = React.createClass
  displayName: 'Top Bar Button'
  render: ->
    active = @props.currentPage == @props.page
    activeClass = if active then 'active' else ''

    Madeleines.Components.Button({
      className: "change-page #{@props.side} #{activeClass}"
      action: if active then undefined else @props.action
    }, @props.children)

TopBar = React.createClass
  displayName: 'Top Bar'
  render: ->
    {Icon} = Madeleines.Components

    if @props.currentPage in ['none', 'bake', '404']
      action = viewIndex
      text = 'Today\'s'
    else
      action = viewBaker
      text = 'Bake'

    div {className: 'top-bar'},
      div {className: 'top-bar-content'},
        TopBarButton({
          currentPage: @props.currentPage
          page: 'index'
          action: viewIndex
          side: 'left'
        }, 'Today')
        TopBarButton({
          currentPage: @props.currentPage
          page: 'bake'
          action: viewBaker
          side: 'left'
        }, 'Bake')
        TopBarButton({
          currentPage: @props.currentPage
          page: 'howto'
          action: viewHowTo
          side: 'right'
        }, Icon({name: 'question mark'}))
        TopBarButton({
          currentPage: @props.currentPage
          page: 'settings'
          action: viewSettings
          side: 'right'
        }, Icon({name: 'gear'}))

Madeleines.Components.TopBar = TopBar
