class Oblique.Routers.Quips extends Backbone.Router
  routes:
    '': 'index'
    'quips/:id': 'show'

  initialize: ->
    @collection = new Oblique.Collections.Quips()
    @collection.fetch()

  index: ->
    view = new Oblique.Views.QuipsIndex(collection: @collection)
    $('#quips_container').html(view.render().el)

  show: (id) ->
    alert "Entry #{id}"
    $('#quips_container').html(view.render().el)
