Base      = require "#{ process.env.APP_ROOT }/core/lib/models/base"
{pick}    = require 'underscore'
UserStore = require './datastore'

{generateHashedPassword} = require './lib/password'

module.exports = class User extends Base
  @findOne: (args...) ->
    cb = args.pop()

    UserStore.findOne args..., (err, record) ->
      return cb err if err?

      cb null, new User record


  constructor: (@attributes={}) ->

  save: (cb) =>
    attributes = whitelist @attributes

    generateHashedPassword attributes.password, (err, hashedPassword) =>
      return cb err if err?

      @attributes.password = attributes.password = hashedPassword
      (new UserStore attributes).save cb


  whitelist = (attributes) ->
    pick attributes, 'name', 'email', 'password'