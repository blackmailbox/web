module.exports = class User

  constructor: (@user) ->

  toHash: =>
    {
      id    : @user.get '_id'
      name  : @user.get 'name'
      email : @user.get 'email'
    }
