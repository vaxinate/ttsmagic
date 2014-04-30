window.Ttsmagic = new Backbone.Marionette.Application()

window.Ttsmagic.addInitializer ->
  @addRegions(
    mainRegion: '#main'
  )

  Backbone.history.start()

$(document).ready ->
  Ttsmagic.start()
