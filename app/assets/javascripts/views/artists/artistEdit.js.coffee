class Betabox.Views.ArtistEdit extends Backbone.View

  template: JST['artists/artistEdit']
  
  initialize: ->
    @model.on('change', @render, this)
    
    
  events: ->
    'click .save' : 'save'
    'click .delete' : 'delete'
    
  render: ->
    $(@el).html(@template(artist: @model))
    this
    
  save: (e)->
    e.preventDefault()
    this.model.set({
      name: $('#name').val()
      bio: $('#bio').val()
      photo: $('#photo').val()
    })
    
    if (this.model.isNew())
      self = this
      alert('isnew')
    else
      console.log('save')
      this.model.save()
      id = this.model.get('id')
      window.router.navigate("/artists/#{id}", {trigger: true})
      
          

  delete: (e)->
    this.model.destroy {
      success: ->
        #alert('Artist Deleted')
        window.router.navigate("artists", {trigger: true})
    }
    return false
    