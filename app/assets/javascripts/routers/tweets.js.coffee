class Oblique.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index'
    'tweets/:id': 'show'

  initialize: ->
    @collection = new Oblique.Collections.Tweets()
    @collection.fetch()

  index: ->
    view = new Oblique.Views.TweetsIndex(collection: @collection)
    $('#tweets_container').html(view.render().el)

  show: (id) ->
    alert "Entry #{id}"
