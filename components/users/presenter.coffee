module.exports = class User

  constructor: (@user) ->

  toHash: =>
    {
      id          : @user.get '_id'
      uuid        : @user.get 'uuid'
      accessToken : @user.get 'accessToken'
    }
