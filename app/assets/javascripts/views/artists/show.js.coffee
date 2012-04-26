class Betabox.Views.ArtistsShow extends Backbone.View

  template: JST['artists/show']
  
  initialize: ->
    @model.on('change', @render, this)
    
  render: (e)->
    $(@el).html(@template(artist: @model))
    this