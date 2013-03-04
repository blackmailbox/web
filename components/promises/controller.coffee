Promise           = require './model'
{extend, isEmpty} = require 'underscore'
PromisesPresenter = require './presenter'

exports.show = (req, res) ->
  {id} = req.params

  Promise.findOne { _id: id }, (err, promise) ->
    return res.json 500, { error: 'An error occurred while looking up promise' } if err?
    return res.json 404, { error: "No promise found with id '#{ id }'" } unless promise?

    renderPromise promise, 200, res

exports.create = (req, res) ->
  req.body.promise ?= {}
  promise = new Promise (extend req.body.promise, { userId: req.params.id })

  promise.save (err, promise) ->
    return res.json 500, { error: 'An error occurred' } if err?
    renderPromise promise, 201, res


exports.userPromises = (req, res) ->
  {id} = req.params

  Promise.findAllByUserId id, (err, promises) ->
    return res.json 500, { error: 'An error occurred while looking up promises for user' } if err?
    return res.json 200, { promises: [] } if isEmpty promises

    promises = ((new PromisesPresenter promise).toHash() for promise in promises)
    res.json 200, { promises }


###########
# PRIVATE #
###########

renderPromise = (promise, status, res) ->
  promise = (new PromisesPresenter promise).toHash()
  res.json status, { promise }