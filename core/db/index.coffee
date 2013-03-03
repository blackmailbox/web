config = require './config/environment_config'

mongoose = require 'mongoose'

db = mongoose.createConnection config.db.host

db.on 'error', ->
  console.log 'An error occured while attempting to connect to database'

db.once 'open', ->
  console.log 'Opened database connection successfully!'

module.exports = { mongoose, db }