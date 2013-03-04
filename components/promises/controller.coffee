Promise           = require './model'
{extend}          = require 'underscore'
PromisesPresenter = require './presenter'

exports.show = (req, res) ->
  {id} = req.params

  Promise.findOne { _id: id }, (err, promise) ->
    return res.json 500, { error: 'An error occurred while looking up promise' } if err?
    return res.json 404, { error: "No promise found with id '#{ id }'" } unless promise?

    renderPromise promise, 200, res

exports.create = (req, res) ->
  promise = new Promise (extend req.body.promise, { userId: req.params.id })

  promise.save (err, promise) ->
    return res.json 500, { error: 'An error occurred' } if err?
    renderPromise promise, 201, res


###########
# PRIVATE #
###########

renderPromise = (promise, status, res) ->
  promise = (new PromisesPresenter promise).toHash()
  res.json status, { promise }