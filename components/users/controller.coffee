User          = require './model'
UserPresenter = require './presenter'

exports.show = (req, res) ->
  {id} = req.params

  User.findOne { id }, (err, user) ->
    return res.json 500, { error: 'An error occurred while looking up user' } if err?
    return res.json 404, { error: "No user found with id '#{ id }'" } unless user?

    respondWithUser user, 200, res

exports.create = (req, res) ->
  userParams = req.body.user

  unless userParams.id? and userParams.accessToken?
    return res.json 400, { error: 'Must provide facebook access token and facebook id' }

  User.findOrCreateBy userParams, (err, user) ->
    return res.json 500, { error: 'An error occurred' } if err?

    respondWithUser user, 200, res


###########
# PRIVATE #
###########

respondWithUser = (user, status, res) ->
  user = (new UserPresenter user).toHash()
  res.json status, { user }
