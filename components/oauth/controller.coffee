qs             = require 'qs'
config         = require "#{ process.env.APP_ROOT }/core/config/environment_config"
OauthSession   = require './datastore'
{tokenRequest} = require './lib/oauth_requests'

googleApiConfig = config.google_apis

exports.authenticate = (_, res) ->
  res.redirect buildOauthUrl()

exports.authorize = (req, res) ->
  {code} = req.query

  tokenRequest code, (response) ->
    res.json 200, { response }

exports.persistTokens = (req, res) ->
  (new OauthSession req.body).save (err, record) ->
    res.send 200


###########
# PRIVATE #
###########

buildOauthUrl = ->
  "#{ config.oauth.url }?#{ buildQueryParams() }"

buildQueryParams = ->
  qs.stringify
    scope         : googleApiConfig.scope
    client_id     : googleApiConfig.client_id
    access_type   : googleApiConfig.access_type
    redirect_uri  : googleApiConfig.redirect_uri
    response_type : googleApiConfig.response_type
