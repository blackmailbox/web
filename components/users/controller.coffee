User = require './model'

exports.show = (req, res) ->
  {id} = req.params

  User.find { _id: id }, (err, users) ->
    if user?
      res.json { user }
    else
      res.json { error: "No user found with id '#{ id }'", status: 404 }

exports.create = (req, res) ->
  user = new User req.body.user

  user.save (err, user) ->
    console.log user

    if err?
      res.json { error: 'An error occured while trying to save record', status: 500 }
    else
      res.json { user }