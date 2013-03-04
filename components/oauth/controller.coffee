qs           = require 'qs'
config       = require "#{ process.env.APP_ROOT }/core/config/environment_config"
OauthSession = require './datastore'

googleApiConfig = config.google_apis

exports.authenticate = (_, res) ->
  res.redirect buildOauthUrl()

exports.authorize = (req, res) ->
  {code} = req.query

  res.redirect buildTokenUrl code

exports.persistTokens = (req, res) ->
  res.json 200,
    body: req.body
    params: req.params
    query: req.query


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

buildTokenUrl = (authCode) ->
  "#{ config.oauth.token_url }?#{ buildTokenQueryParams authCode }"

buildTokenQueryParams = (authCode) ->
  qs.stringify
    code          : authCode
    client_id     : googleApiConfig.client_id
    grant_type    : googleApiConfig.grant_type
    redirect_uri  : 'http://blackmailboxapp.com/oauth/persist_tokens'
    client_secret : googleApiConfig.client_secret