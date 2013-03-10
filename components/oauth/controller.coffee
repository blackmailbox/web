OAuthSession = require './datastore'
{getTokens, googleOAuthUrl} = require './lib/google_oauth'

exports.authenticate = (_, res) ->
  res.redirect googleOAuthUrl

exports.authorize = (req, res) ->
  {code} = req.query

  getTokens code, (err, response) ->
    return res.json 500, { err } if err?
    return res.json 500, { response } if response.error?

    (new OAuthSession response).save (err) ->
      return res.json 500, { err, message: 'Error persisting session' } if err?

      res.json 200, { message: 'Successfully authenticated' }
