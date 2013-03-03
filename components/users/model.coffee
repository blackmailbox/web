UserStore = require './datastore'

{generateHashedPassword} = require './lib/password'

module.exports = class User
  @find: (args...) ->
    UserStore.find(args...)

  constructor: (@data={}) ->

  save: (cb) ->
    generateHashedPassword @data.password, (err, hashedPassword) =>
      @data.password = hashedPassword

      (new UserStore @data).save (err, user) ->
        console.log user
        cb err, user

  authenticate: (cb) ->
