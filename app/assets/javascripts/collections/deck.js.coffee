class Ttsmagic.DeckCollection extends Backbone.Collection
  initialize: ->
    @listenTo Ttsmagic.vent, 'card:selected', @onCardSelected
    @listenTo Ttsmagic.vent, 'card:removed', @onCardRemoved

  onCardSelected: (cardData) ->
    @add new Ttsmagic.CardModel(cardData)

  onCardRemoved: (card) ->
    @remove card
