class Betabox.Views.Artist extends Backbone.View

  template: JST['artists/artist']
  
  initialize: ->
    console.log("initialize() called for view model #{this.model.get('name')}")
    @model.on('change', @render, this)
    $(window).keypress this.listen_keypress
    @notifier = new Betabox.Msg
    
  leave: ->
    $(window).off 'keypress', this.listen_keypress
    console.log("leave() called for view with model #{this.model.get('name')}")
    this.remove()
    
  events: ->
    'blur [contenteditable]': 'ce_blur'
    'click .save' : 'save'
    'click .edit': 'edit'
    
  render: (e)->
    $(@el).html(@template(artist: @model))
    this
    
  save: (e)->
    e.preventDefault()
    photoLongPath = $('#photo').attr('src')
    
    if photoLongPath?
      photoPath = photoLongPath.replace(/http:\/\/riotactcomedy.com\/crop\/500\/500\/c\//, '')
    else
      photoPath = ''
    
    this.model.set({
      name: $('#name').html()
      bio: $('#bio').html()
      photo: photoPath
    })

    if (this.model.isNew())
      self = this
      alert('isnew')
    else
      @notifier.success("Saved changes to #{this.model.get('name')}.")
      this.model.save()
      #id = this.model.get('id')
      #window.router.navigate("/artists/#{id}", {trigger: true})
  
  edit: ->
    id = this.model.get('id')
    
    window.router.navigate("/artists/#{id}/edit", {trigger: true})
  
  ce_blur: (e)->
    #$el = $(e.currentTarget)
    
    
    
  listen_keypress: (e) ->
    console.log(e.keyCode)
    if (e.which isnt 115 and e.ctrlKey) and (e.which is 19)
      $('.save').trigger('click')
    
    