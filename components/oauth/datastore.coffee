{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

OAuthSessionSchema = new mongoose.Schema
  token_type: String
  access_token: String
  refresh_token: String
  expires_in: Number

module.exports = db.model('OAuthSession', OAuthSessionSchema)