class @Router extends @EventEmitter

  # @private
  # @property [String] The currently routed url (private)
  currentUrl: null

  constructor: (app) ->
    @_logger = new ledger.utils.Logger("Router", yes) #TODO: Logging

    # initialize router
    @_router = crossroads.create()
    @_router.normalizeFn = crossroads.NORM_AS_OBJECT
    @_router.ignoreState = on

    # listen events
    @_router.routed.add (url, data) =>
      oldUrl = @currentUrl
      @currentUrl = url
      @emit 'routed', {oldUrl, url, data}
    @_router.bypassed.add (url, data) =>
      e "No route found for #{url}"
      @emit 'bypassed', {url: url, data: data}


    # add routes
    declareRoutes(@_addRoute.bind(@), app)

  go: (url, params) ->
    setTimeout( =>
      path = url.parseAsUrl().pathname
      if ledger.app.dongle? or ledger.router.pluggedWalletRoutesExceptions.indexOf(path) != -1 or (ledger.router.ignorePluggedWalletForRouting? and ledger.router.ignorePluggedWalletForRouting == yes)
        url = ledger.url.createUrlWithParams(url, params)
        # @_logger.info("Routing to [#{url}]")
        @_router.parse(url)
    , 0)

  _addRoute: (url, callback) ->
    route = @_router.addRoute url + ':?params::#action::?params:'
    route.matched.add callback.bind(route)

  setLoggingEnabled: (enabled) -> @_logger.setActive(enabled)

