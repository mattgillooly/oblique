class Oblique.Views.QuipsIndex extends Backbone.View

  template: JST['quips/index']

  events:
    'submit #new_quip': 'createQuip'

  initialize: ->
    @settings = @options.settings
    @collection.on('reset', @render, this)
    @collection.on('add', @appendQuip, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendQuip)
    @renderSettings()
    this

  renderSettings: ->
    view = new Oblique.Views.Settings(model: @settings)
    @$('#settings_container').html(view.render().el)

  appendQuip: (quip) ->
    view = new Oblique.Views.Quip(model: quip)
    @$('#quips').append(view.render().el)

  createQuip: (event) ->
    event.preventDefault()
    attributes = text: $('#quip_text').val()
    @collection.create attributes,
      wait: true
      success: -> $('#new_quip')[0].reset()
      error: @handleError

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
