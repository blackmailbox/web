{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

UserSchema = new mongoose.Schema
  uuid: { type: String, default: null }
  accessToken: String

module.exports = db.model('User', UserSchema)