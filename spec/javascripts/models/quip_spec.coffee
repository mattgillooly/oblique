describe 'Quip model', ->
  describe 'when instantiated', ->
    it 'should exhibit attributes', ->
      quip = new Oblique.Models.Quip({text: 'Hey smart people!'})
      expect(quip.get('text')).toEqual('Hey smart people!');
