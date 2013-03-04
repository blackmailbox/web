{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

UserSchema = new mongoose.Schema
  id          : String
  name        : String
  first_name  : String
  last_name   : String
  username    : String
  accessToken : String
  active      : { type: Boolean, default: false }

module.exports = db.model('User', UserSchema)