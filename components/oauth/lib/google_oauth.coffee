{OAuth2Client}        = require 'googleapis'
{google_apis: config} = require "#{ process.env.APP_ROOT }/core/config"

exports.OAuthClient = OAuthClient =
  new OAuth2Client(
    config.client_id,
    config.client_secret,
    config.redirect_uri
  )

exports.googleOAuthUrl =
  OAuthClient.generateAuthUrl
    scope           : config.scope
    access_type     : config.access_type
    response_type   : config.response_type
    approval_prompt : config.approval_prompt

TOKENS = {}

exports.getTokens = -> TOKENS

exports.resetTokens = (code, cb) ->
  OAuthClient.getToken code, (err, response) ->
    return cb err if err?

    TOKENS =
      access_token: response.access_token
      refresh_token: response.refresh_token

    cb null, response
