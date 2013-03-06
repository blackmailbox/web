cache = -> cache.app
cache.set = ((@app) ->).bind cache

module.exports = cache
