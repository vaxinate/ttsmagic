window.Ttsmagic = new Backbone.Marionette.Application()

window.Ttsmagic.addInitializer ->
  @addRegions(
    mainRegion: '#main'
  )

  Backbone.history.start()
  @deck = new Ttsmagic.DeckCollection()
  @mainRegion.show(new Ttsmagic.DeckView collection: @deck)

$(document).ready ->
  Ttsmagic.start()
