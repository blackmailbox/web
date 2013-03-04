async = require 'async'

{ APP_ROOT } = process.env

User    = require "#{ APP_ROOT }/components/users/datastore"
Promise = require "#{ APP_ROOT }/components/promises/datastore"

console.log 'Seeding database...'

deleteUsers = (cb) ->
  User.find().remove (err, count) ->
    cb err if err?
    console.log "Removed #{count} records from User table"
    cb null

deletePromises = (cb) ->
  Promise.find().remove (err, count) ->
    cb err if err?
    console.log "Removed #{count} records from Promise table"
    cb null

async.parallel [
  deleteUsers
  deletePromises
], (err) ->
  throw err if err?

  console.log "Removed Users and Promises"
  process.exit 0
