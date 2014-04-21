class Ttsmagic.Views.Header extends Backbone.View
  initialize: ->
    console.log 'hi i am the header!'
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
