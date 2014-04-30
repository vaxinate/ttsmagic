# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Ttsmagic.addInitializer ->
  new Ttsmagic.HeaderView()
  @addRegions(
    mainRegion: '#main'
    statsRegion: '#stats'
    formRegion: '#form'
  )

  @deck = new Ttsmagic.DeckCollection()

  @mainRegion.show(new Ttsmagic.DeckView collection: @deck)
  @statsRegion.show(new Ttsmagic.StatsView collection: @deck)

  #formView = new Ttsmagic.FormView()
  #@formRegion.show(formView)

  #formView.fieldset.show(new Ttsmagic.FieldsetView collection: @deck)
