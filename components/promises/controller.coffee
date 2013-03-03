Promise           = require './model'
PromisesPresenter = require './presenter'

exports.show = (req, res) ->
  {id} = req.params

  Promise.findOne { _id: id }, (err, promise) ->
    promise = (new PromisesPresenter promise).toHash()
    return res.json { promise } if promise?

    res.json
      status: 404
      error: "No promise found with id '#{ id }'"

exports.create = (req, res) ->
  promise = new Promise req.body.promise

  promise.save (err, promise) ->
    promise = (new PromisesPresenter promise).toHash()
    return res.json { promise } unless err?

    res.json
      status: 500
      error: 'An error occured while trying to save record'
