{APP_ROOT} = process.env

Path = require 'path'
app  = do require "#{ APP_ROOT }/core/lib/instance_cache"

requireController = (component) ->
  require "#{ APP_ROOT }/components/#{ component }/controller"

namespace = (namespace, func) ->
  routeMethods = {}

  for verb in ['get', 'post', 'put', 'delete']
    routeMethods[verb] = do (verb) ->
      (path, cb) ->
        path = Path.normalize "/#{ namespace }/#{ path }"
        app[verb] path, cb

  func(routeMethods)

module.exports = { namespace, requireController }