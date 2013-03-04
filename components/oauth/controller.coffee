qs     = require 'qs'
config = require "#{ process.env.APP_ROOT }/core/config/environment_config"

googleApiConfig = config.google_apis

exports.authenticate = (req, res) ->
  res.redirect buildOauthUrl()


exports.authorize = (req, res) ->
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
