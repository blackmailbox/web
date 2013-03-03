bcrypt = require 'bcrypt'

exports.generateHashedPassword = (password, cb) ->
  bcrypt.genSalt 10, (err, salt) ->
    return cb err if err?

    bcrypt.hash password, salt, (err, hashedPassword) ->
      return cb err if err?

      cb null, hashedPassword

exports.isMatch = (password, hash, cb) ->
  bcrypt.compare password, hash, cb