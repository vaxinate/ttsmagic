class Ttsmagic.FormView extends Backbone.Marionette.CompositeView
  tagName: 'form'
  attributes:
    action: '/deck'
    method: 'POST'
  template: JST['form']
  itemView: Ttsmagic.FieldView
  itemViewContainer: '.fields'
