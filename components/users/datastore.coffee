{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

UserSchema = new mongoose.Schema
  id          : { type: String, default: null }
  name        : String
  first_name  : String
  last_name   : String
  username    : String
  accessToken : String

module.exports = db.model('User', UserSchema)