module.exports = class Promise

  constructor: (@promise) ->

  toHash: =>
    {
      id           : @promise.get '_id'
      userId       : @promise.get 'userId'
      status       : @promise.get 'status'
      posted       : @promise.get 'posted'
      expiresAt    : @promise.get 'expiresAt'
      description  : @promise.get 'description'
    }
