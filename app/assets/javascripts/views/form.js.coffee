class Ttsmagic.FormView extends Backbone.Marionette.CompositeView
  tagName: 'form'
  attributes:
    action: '/decks'
    method: 'POST'
  template: JST['form']
  itemView: Ttsmagic.FieldView
  itemViewContainer: '.fields'
