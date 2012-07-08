window.Oblique =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Oblique.Routers.Quips()
    Backbone.history.start();

$(document).ready ->
  Oblique.init()
