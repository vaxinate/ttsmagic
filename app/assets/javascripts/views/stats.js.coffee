class Ttsmagic.StatsView extends Backbone.View
  template: JST['stats']
  initialize: ->
    @listenTo(@collection, 'add remove', @render)

  render: ->
    @$el.html @template(@collection)
    return this
