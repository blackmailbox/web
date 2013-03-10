{OAuth2Client}        = require 'googleapis'
{google_apis: config} = require "#{ process.env.APP_ROOT }/core/config"

oauth2Client = new OAuth2Client(
  config.client_id,
  config.client_secret,
  config.redirect_uri
)

exports.googleOAuthUrl =
  oauth2Client.generateAuthUrl
    scope           : config.scope
    access_type     : config.access_type
    response_type   : config.response_type
    approval_prompt : config.approval_prompt

exports.getTokens = (code, cb) ->
  oauth2Client.getToken code, cb
