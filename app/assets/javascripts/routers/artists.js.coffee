class Betabox.Routers.Artists extends Backbone.Router
  routes:
    'artists': 'index'
    'artists/new': 'new'
    'artists/:id/edit': 'edit'
    'artists/:id': 'show'
    
  initialize: (data)->
    @collection = data.artists
    
    @side = $('#side .content')
    @main = $("#main .content")
    
    view = new Betabox.Views.Sidebar(collection: @collection)
    @side.html(view.render().el)
    
  index: ->
    @main.html('')

  show: (id)->      
    
    if @active_view
      @active_view.leave()
      
    @artist = @collection.get(id)
    view = new Betabox.Views.Artist(model: @artist)
    
    @active_view = view
    
    @main.html(view.render().el)

  new: ()->
    @artist = new Betabox.Models.Artist()
    
    view = new Betabox.Views.ArtistEdit(model: @artist)
    @main.html(view.render().el)
    
  edit: (id)->
    @artist = @collection.get(id)
    view = new Betabox.Views.ArtistEdit(model: @artist)
    @main.html(view.render().el)
      
      