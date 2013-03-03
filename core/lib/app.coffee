cache = ->
  cache.app

cache.set = (app) -> @app = app
cache.set.bind cache

module.exports = cache
