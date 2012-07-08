window.Oblique =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Oblique.Routers.Tweets()
    new Oblique.Routers.Settings()
    Backbone.history.start();

$(document).ready ->
  Oblique.init()
