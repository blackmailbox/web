fs = require 'fs'

exports.run = ->
  path = process.env.APP_ROOT + '/core/config/initializers'

  fs.readdir path, (err, files) ->
    throw err if err?
    for file in files when file isnt 'index.coffee'
      require "#{path}/#{file}"