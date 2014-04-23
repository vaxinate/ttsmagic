class Ttsmagic.HeaderView extends Backbone.View
  el: '#header'
  initialize: ->
    cards = new Bloodhound
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
      queryTokenizer: Bloodhound.tokenizers.whitespace
      limit: 10
      prefetch: { url: '/cards.json' }

    cards.initialize()

    @$('#new-todo').typeahead null,
      name: 'cards'
      displayKey: 'name'
      source: cards.ttAdapter()

  events:
    'typeahead:selected #new-todo': 'onTypeaheadSelect'

  onTypeaheadSelect: (ev, suggestion, datasetName) ->
    Ttsmagic.vent.trigger 'card:selected', suggestion
    $('#new-todo').typeahead('val', '')

