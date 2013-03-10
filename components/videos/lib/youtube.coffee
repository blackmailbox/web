{APP_ROOT} = process.env
googleAPIs = require 'googleapis'

{OAuthClient, getTokens} = require "#{ APP_ROOT }/components/oauth/lib/google_oauth"

YouTube = null

googleAPIs.load 'youtube', 'v3', (err, client) ->
  throw err if err?

  YouTube = client.youtube


exports.getVideo = (id, cb) ->
  OAuthClient.credentials = getTokens()

  request = YouTube.videos.list({ id, part: 'snippet' }).withAuthClient(OAuthClient)
  request.execute (err, response) ->
    return cb err if err?

    cb null, response.items[0]