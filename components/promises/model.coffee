Base         = require "#{ process.env.APP_ROOT }/core/lib/models/base"
{pick}       = require 'underscore'
PromiseStore = require './datastore'

module.exports = class Promise extends Base
  @findOne: (args...) ->
    cb = args.pop()

    PromiseStore.findOne args..., (err, record) ->
      return cb err if err?

      cb null, new Promise record, { isExistingRecord: true }

  constructor: (@attributes={}, { isExistingRecord }={}) ->
    unless isExistingRecord
      @set 'status', 'incomplete'
      @set 'posted', false

  save: (cb) =>
    console.log @attributes
    attributes = whitelist @attributes
    console.log attributes

    (new PromiseStore attributes).save cb

  whitelist = (attributes) ->
    pick attributes, 'userId', 'description', 'posted', 'status', 'expiresAt'