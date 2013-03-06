qs              = require 'qs'
https           = require 'https'
config          = require "#{ process.env.APP_ROOT }/core/config"
googleApiConfig = config.google_apis

exports.tokenRequest = (code, cb) ->
  options = buildTokenRequest()

  req = https.request options, (response) ->
    data = ''
    response.on 'data', (chunk) ->
      data += chunk
    response.on 'end', ->
      cb null, data

  req.write requestBody()
  req.end()

buildTokenRequest = (authCode) ->
  hostname: 'accounts.google.com'
  path: '/o/oauth2/token'
  port: 443
  method: 'POST'
  headers: { 'content-type': 'application/x-www-form-urlencoded' }

requestBody = (authCode) ->
  qs.stringify
    code          : authCode
    client_id     : googleApiConfig.client_id
    grant_type    : googleApiConfig.grant_type
    redirect_uri  : 'http://blackmailboxapp.com/oauth/persist_tokens'
    client_secret : googleApiConfig.client_secret