{APP_ROOT} = process.env

{requireController, namespace} = require "#{ APP_ROOT }/core/lib/route_helpers"

Users    = requireController 'users'
Oauth    = requireController 'oauth'
Promises = requireController 'promises'

##########
# ROUTES #
##########

namespace 'api', ({ get, post }) ->
  get '/users/:id', Users.show
  get '/users/:id/promises', Promises.userPromises
  get '/promises/:id', Promises.show

  post '/users', Users.create
  post '/users/:id/promises', Promises.create

namespace 'oauth', ({ get }) ->
  get '/authenticate', Oauth.authenticate
  get '/authorize', Oauth.authorize
  get '/persist_tokens', Oauth.persistTokens