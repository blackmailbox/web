User          = require './model'
{pick}        = require 'underscore'
UserPresenter = require './presenter'

exports.show = (req, res) ->
  {id} = req.params

  User.findOne { _id: id }, (err, user) ->
    user = (new UserPresenter user).toHash()
    return res.json { user } if user?

    res.json
      status: 404
      error: "No user found with id '#{ id }'"

exports.create = (req, res) ->
  user = new User req.body.user

  user.save (err, user) ->
    user = whitelist user
    return res.json { user } unless err?

    res.json
      status: 500
      error: 'An error occured while trying to save record'
