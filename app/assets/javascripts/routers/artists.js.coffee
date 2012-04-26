class Betabox.Routers.Artists extends Backbone.Router
    routes:
      '': 'index'
      'artists/new': 'new'
      'artists/:id/edit': 'edit'
      'artists/:id': 'show'
      
      
    initialize: ->
      @collection = new Betabox.Collections.Artists()
      @collection.fetch()
      window.c = @collection
      @side = $('#side .content')
      @main = $("#main .content")
      this.index() # load the sidebar!
      
    index: ->
      view = new Betabox.Views.ArtistsIndex(collection: @collection)
      window.sidebar = view
      @side.html(view.render().el)

    show: (id)->      
      #@artist = new Betabox.Models.Artist(id: id)
      if @collection?
        @artist = @collection.get(id)
        #@artist.fetch()
        view = new Betabox.Views.ArtistsShow(model: @artist)
        @main.html(view.render().el)
    
    new: ()->
      @artist = new Betabox.Models.Artist()
      #@artist = @collection.get(id)
      
      view = new Betabox.Views.ArtistForm(model: @artist)
      @main.html(view.render().el)
      
    edit: (id)->
      @artist = @collection.get(id)
      view = new Betabox.Views.ArtistForm(model: @artist)
      @main.html(view.render().el)
        