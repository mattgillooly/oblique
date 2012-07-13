describe "Oblique.Routers.Quips", ->
  beforeEach ->
    @router = new Oblique.Routers.Quips
    @routeSpy = sinon.spy()
    try
      Backbone.history.start({silent:true, pushState:true})
    @router.navigate("elsewhere")

  it "fires the random route with a blank hash", ->
    @router.bind("route:random", @routeSpy)
    @router.navigate("", true)
    expect(@routeSpy).toHaveBeenCalledOnce()
    expect(@routeSpy).toHaveBeenCalledWith()

  it "fires the index route with #manage", ->
    @router.bind("route:index", @routeSpy)
    @router.navigate("manage", true)
    expect(@routeSpy).toHaveBeenCalledOnce()
    expect(@routeSpy).toHaveBeenCalledWith()
