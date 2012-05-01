class Betabox.Views.Sidebar extends Backbone.View

  template: JST['artists/sidebar']
  
  initialize: ->
    @collection.on('reset', @render, this)
    
  events: ->
    'click a': 'artistClick'
    'click .new': 'newArtist'
    
  render: ->
    self = this
    
    this.$el.html(@template())
    
    @collection.each (item)->
      sidebarItemView = new Betabox.Views.SidebarItem(model: item)
      self.$('ul').append(sidebarItemView.render().el)
    this
      
    
  artistClick: (e)->
    $clicked = $(e.currentTarget)
    this.clear()
    $clicked.addClass('active')
   
  
  newArtist: ->
    clear()
    window.location = '/#artists/new'
  
  clear: ->
    $('#side a.active').removeClass('active')
