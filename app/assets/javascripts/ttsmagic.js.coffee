window.Ttsmagic = new Backbone.Marionette.Application()

$(document).ready ->
  Ttsmagic.addInitializer ->
    Backbone.History.Start()
    @addRegions(
      header: '#header'
      main: '#main'
      footer: '#footer'
    )

  Ttsmagic.start()
