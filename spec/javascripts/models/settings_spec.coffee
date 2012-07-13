describe 'Settings model', ->
  describe 'when instantiated', ->
    it 'should exhibit attributes', ->
      quip = new Oblique.Models.Settings({tweet_hourly: false})
      expect(quip.get('tweet_hourly')).toEqual(false)
