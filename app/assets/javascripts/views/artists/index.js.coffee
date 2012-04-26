class Betabox.Views.ArtistsIndex extends Backbone.View

  template: JST['artists/index']
  
  initialize: ->
    @collection.on('reset', @render, this)
    
  events: ->
    'click a': 'artistClick'
    'click .new': 'newArtist'
    
  render: ->
    $(@el).html(@template(artists: @collection))
    this
    
  artistClick: (e)->
    $clicked = $(e.currentTarget)
    this.clearSidebar()
    $clicked.addClass('active')
   
  
  newArtist: ->
    clearSidebar()
    window.location = '/#artists/new'
  
  clearSidebar: ->
    $('#side a.active').removeClass('active')
    console.log ('clear sidebar called')
