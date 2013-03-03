module.exports = class User

  constructor: (@user) ->

  toHash: =>
    {
      name  : @user.get 'name'
      email : @user.get 'email'
    }
