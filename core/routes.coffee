{APP_ROOT} = process.env

{requireController, namespace} = require "#{ APP_ROOT }/core/lib/route_helpers"

Users    = requireController 'users'
OAuth    = requireController 'oauth'
Videos   = requireController 'videos'
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
  get '/authenticate', OAuth.authenticate
  get '/authorize', OAuth.authorize

namespace 'videos', ({ get }) ->
  get '/:id', Videos.show