{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

PromiseSchema = new mongoose.Schema
  userId: String
  status: String
  posted: Boolean
  expiresAt: String
  description: String

module.exports = db.model('Promise', PromiseSchema)