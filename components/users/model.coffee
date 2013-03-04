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
]

module.exports = class User extends Base
  @findOne: (args...) ->
    cb = args.pop()

    UserStore.findOne args..., (err, record) ->
      return cb err if err?

      cb null, (if record? then new User record else null)

  constructor: (@attributes={}) ->

  save: (cb) =>
    (new UserStore whitelist @attributes).save cb

  whitelist = (attributes) ->
    pick attributes, WHITELISTED_ATTRIBUTES...
