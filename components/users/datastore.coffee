{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

UserSchema = new mongoose.Schema
  name: String
  email: String
  password: String

module.exports = db.model('User', UserSchema)