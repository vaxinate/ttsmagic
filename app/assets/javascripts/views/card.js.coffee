class Ttsmagic.CardView extends Backbone.Marionette.ItemView
  tagName: 'li'
  template: JST['item']

  events:
    'click .destroy': 'onClickDestroy'

  onClickDestroy: (ev) ->
    Ttsmagic.vent.trigger('card:removed', @model)
