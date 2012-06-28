class Oblique.Views.Tweet extends Backbone.View
  template: JST['tweets/tweet']
  tagName: 'div'

  render: ->
    $(@el).html(@template(tweet: @model))
    this
