class Oblique.Views.Quip extends Backbone.View
  template: JST['quips/quip']
  tagName: 'div'

  render: ->
    $(@el).html(@template(quip: @model))
    this
