window.Ttsmagic = new Backbone.Marionette.Application()

window.Ttsmagic.addInitializer ->

  Backbone.history.start()

$(document).ready ->
  Ttsmagic.start()
