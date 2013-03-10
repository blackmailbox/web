OAuthSession = require './datastore'
{resetTokens, googleOAuthUrl} = require './lib/google_oauth'

exports.authenticate = (_, res) ->
  res.redirect googleOAuthUrl

exports.authorize = (req, res) ->
  {code} = req.query

  resetTokens code, (err, response) ->
    return res.json 500, { error: 'Error getting access tokens' } if err?
    return res.json 500, { response } if response.error?

    (new OAuthSession response).save (err) ->
      return res.json 500, { error: 'Error persisting session' } if err?

      res.json 200, { message: 'Successfully authenticated' }
