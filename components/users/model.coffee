Base      = require "#{ process.env.APP_ROOT }/core/lib/models/base"
{pick}    = require 'underscore'
UserStore = require './datastore'

WHITELISTED_ATTRIBUTES = [
  'id'
  'name'
  'first_name'
  'last_name'
  'username'
  'accessToken'
  'active'
]

module.exports = class User extends Base
  @findOne: (args...) ->
    cb = args.pop()

    UserStore.findOne args..., (err, record) ->
      return cb err if err?

      cb null, (if record? then new User record else null)

  @findOrCreateBy: (userAttributes, cb) ->
    return cb (new Error 'Must include id') unless userAttributes.id?

    User.findOne userAttributes.id, (err, user) ->
      return cb err if err?
      return cb null, user if user?

      (new User userAttributes).save cb

  constructor: (@attributes={}) ->

  save: (cb) =>
    (new UserStore whitelist @attributes).save cb

  whitelist = (attributes) ->
    pick attributes, WHITELISTED_ATTRIBUTES...


