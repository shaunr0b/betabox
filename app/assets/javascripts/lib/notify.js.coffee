class Betabox.Msg extends window.Betabox
  
  #requirs jQuery.noty, twitter theme
  constructor: ->
  
  success: (text)->
    id = window.noty {
      layout: 'bottomRight'
      text: text
      type: 'success'
      theme: 'noty_theme_twitter'}
    return id