User          = require './model'
UserPresenter = require './presenter'

exports.show = (req, res) ->
  {id} = req.params

  User.findOne { _id: id }, (err, user) ->
    return res.json 500, { error: 'An error occurred while looking up user' } if err?
    return res.json 404, { error: "No user found with id '#{ id }'" } unless user?

    user = (new UserPresenter user).toHash()
    res.json { user }

exports.create = (req, res) ->
  user = new User req.body.user

  user.save (err, user) ->
    return res.json 500, { error: 'An error occurred while trying to save record' } if err?

    user = (new UserPresenter user).toHash()
    return res.json 201, { user } unless err?
