class Betabox.Routers.Artists extends Backbone.Router
    routes:
      '': 'index'
      'artists/new': 'new'
      'artists/:id/edit': 'edit'
      'artists/:id': 'show'
      
      
    initialize: ->
      @collection = new Betabox.Collections.Artists()
      @collection.fetch()
      @side = $('#side .content')
      @main = $("#main .content")
      this.index() #load the sidebar!
      
    index: ->
      view = new Betabox.Views.ArtistsIndex(collection: @collection)
      @side.html(view.render().el)

    show: (id)->      
      @artist = new Betabox.Models.Artist(id: id)
      @artist.fetch()
      view = new Betabox.Views.ArtistsShow(model: @artist)
      @main.html(view.render().el)
    
    new: ()->
      @artist = new Betabox.Models.Artist()
      view = new Betabox.Views.ArtistForm(model: @artist)
      @main.html(view.render().el)
      
    edit: (id)->
      @artist = new Betabox.Models.Artist(id: id)
      @artist.fetch()
      view = new Betabox.Views.ArtistForm(model: @artist)
      @main.html(view.render().el)
        