path  = require 'path'
latte = require 'latte'

{APP_ROOT} = process.env

cacheTemplates = (options, callback) ->
  options.baseDir = path.join(APP_ROOT, options.baseDir)

  latte.stache options, (err) ->
    console.log "Cached templates found in #{options.baseDir}"
    return callback(err) if callback?
    throw err if err?

cacheTemplates({ baseDir: 'components' })
cacheTemplates { baseDir: 'core/layouts', layouts: true }, (err) ->
  throw err if err?
  latte.setDefaultLayout 'application'