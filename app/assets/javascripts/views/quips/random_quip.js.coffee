class Oblique.Views.RandomQuip extends Backbone.View

  template: JST['quips/random']

  events:
    'click #randomQuip': 'displayRandomQuip'

  initialize: ->
    @collection.on('reset', @displayRandomQuip, this)
    @collection.on('change', @displayRandomQuip, this)
    setInterval(@displayRandomQuip, 5000)

  render: ->
    $(@el).html(@template())
    @displayRandomQuip()
    this

  displayRandomQuip: =>
    if quip = @collection.shuffle()[0]
      @$('#randomQuip h1').html(quip.get('text'))
