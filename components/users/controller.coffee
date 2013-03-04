User          = require './model'
UserPresenter = require './presenter'

exports.show = (req, res) ->
  {id} = req.params

  User.findOne { facebookId: id }, (err, user) ->
    return res.json 500, { error: 'An error occurred while looking up user' } if err?
    return res.json 404, { error: "No user found with id '#{ id }'" } unless user?

    respondWithUser user, 200, res

exports.create = (req, res) ->
  userParams = req.body.user

  unless userParams.id? and userParams.accessToken?
    return res.json 400, { error: 'Must provide facebook access token and facebook id' }

  User.findOne { facebookId: userParams.facebookId }, (err, user) ->
    return res.json 500, { error: 'An error occurred' } if err?
    return respondWithUser user, 200, res if user?

    persistUser userParams, res


###########
# PRIVATE #
###########

persistUser = (attributes, res) ->
  (new User attributes).save (err, user) ->
    return res.json 500, { error: 'An error occurred while trying to save record' } if err?

    respondWithUser user, 201, res

respondWithUser = (user, status, res) ->
  user = (new UserPresenter user).toHash()
  res.json status, { user }
