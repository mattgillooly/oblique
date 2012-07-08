class Oblique.Views.Settings extends Backbone.View

  template: JST['settings/show']

  events:
    'click #tweetHourly': 'toggleSettings'

  initialize: ->
    @model.on('change', @displaySettings, this)

  render: ->
    $(@el).html(@template())
    @displaySettings()
    this

  displaySettings: ->
    if @model.get('tweet_hourly')
      @$('#tweetHourly').html("Will tweet hourly")
    else
      @$('#tweetHourly').html("Will not tweet hourly")

  updateSettings: (tweet_hourly) ->
    attributes = {tweet_hourly: tweet_hourly}
    @model.save attributes,
      error: @handleError

  toggleSettings: (event) ->
    event.preventDefault()
    @updateSettings(!@model.get('tweet_hourly'))

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
