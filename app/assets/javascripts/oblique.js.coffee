window.Oblique =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Oblique.Routers.Tweets()
    Backbone.history.start();

$(document).ready ->
  Oblique.init()
