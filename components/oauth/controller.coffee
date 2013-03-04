qs           = require 'qs'
config       = require "#{ process.env.APP_ROOT }/core/config/environment_config"
request      = require 'request'
OauthSession = require './datastore'

googleApiConfig = config.google_apis

theReq = null
theRec = null

exports.authenticate = (_, res) ->
  res.redirect buildOauthUrl()

exports.authorize = (req, res) ->
  {code} = req.query

  request (buildTokenRequest code), (err, response, body) ->
    theReq = { response, body }

    res.send response, body

exports.persistTokens = (req, res) ->
  (new OauthSession req.body).save (err, record) ->
    theRec = record
    res.send 200

exports.getSession = (_, res) ->
  res.json { theReq, theRec }


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

buildTokenRequest = (authCode) ->
  url: config.oauth.token_url
  form: buildTokenParams authCode
  method: 'POST'

buildTokenParams = (authCode) ->
  code          : authCode
  client_id     : googleApiConfig.client_id
  grant_type    : googleApiConfig.grant_type
  redirect_uri  : 'http://blackmailboxapp.com/oauth/persist_tokens'
  client_secret : googleApiConfig.client_secret