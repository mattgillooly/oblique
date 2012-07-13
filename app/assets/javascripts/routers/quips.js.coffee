class Oblique.Routers.Quips extends Backbone.Router
  routes:
    '': 'random'
    'manage': 'index'

  initialize: ->
    @collection = new Oblique.Collections.Quips()
    @collection.fetch()
    @settings = new Oblique.Models.Settings()
    @settings.fetch()

  random: ->
    @collection.fetch()
    view = new Oblique.Views.RandomQuip(collection: @collection)
    $('#quips_container').html(view.render().el)

  index: ->
    @collection.fetch()
    @settings.fetch()
    view = new Oblique.Views.QuipsIndex(collection: @collection, settings: @settings)
    $('#quips_container').html(view.render().el)
