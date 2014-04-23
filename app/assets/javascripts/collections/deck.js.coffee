class Ttsmagic.DeckCollection extends Backbone.Collection
  initialize: ->
    @listenTo Ttsmagic.vent, 'card:selected', @onCardSelected

  onCardSelected: (cardData) ->
    @add new Ttsmagic.CardModel(cardData)
