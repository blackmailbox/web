{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

OauthSessionSchema = new mongoose.Schema
  access_token: String
  refresh_token: String
  expires_in: Number

module.exports = db.model('OauthSession', OauthSessionSchema)