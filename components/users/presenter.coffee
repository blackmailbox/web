module.exports = class User

  constructor: (@user) ->

  toHash: =>
    {
      id          : @user.get 'id'
      name        : @user.get 'name'
      first_name  : @user.get 'first_name'
      last_name   : @user.get 'last_name'
      username    : @user.get 'username'
      accessToken : @user.get 'accessToken'
    }
