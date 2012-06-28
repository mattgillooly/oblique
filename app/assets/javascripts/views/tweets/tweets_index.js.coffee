class Oblique.Views.TweetsIndex extends Backbone.View

  template: JST['tweets/index']

  events:
    'submit #new_tweet': 'createTweet'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTweet, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTweet)
    this

  appendTweet: (tweet) ->
    view = new Oblique.Views.Tweet(model: tweet)
    @$('#tweets').append(view.render().el)

  createTweet: (event) ->
    event.preventDefault()
    attributes = text: $('#tweet_text').val()
    @collection.create attributes,
      wait: true
      success: -> $('#new_tweet')[0].reset()
      error: @handleError

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
