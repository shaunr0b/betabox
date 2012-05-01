class Betabox.Views.SidebarItem extends Backbone.View
  tagName: 'li'
  template: JST['artists/sidebarItem']

  initialize: ->    
    @model.on 'change', @render, this
    
  render: ->
    $(@el).html(@template( model: @model ))
    this