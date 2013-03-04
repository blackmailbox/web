{APP_ROOT} = process.env

app = do require "#{ APP_ROOT }/core/lib/app"

{requireController, namespace} = require "#{ APP_ROOT }/core/lib/route_helpers"

Users    = requireController 'users'
Oauth    = requireController 'oauth'
Landing  = requireController 'landing'
Promises = requireController 'promises'

##########
# ROUTES #
##########

app.get '/', Landing.index

namespace 'api', ({ get, post }) ->
  get  '/users/:id', Users.show
  get  '/promises/:id', Promises.show

  post '/users', Users.create
  post '/users/:id/promises', Promises.create

namespace 'oauth', ({ get }) ->
  get '/authenticate', Oauth.authenticate
  get '/authorize', Oauth.authorize