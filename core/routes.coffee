{APP_ROOT} = process.env

app = do require "#{ APP_ROOT }/core/lib/app"

{requireController, namespace} = require "#{ APP_ROOT }/core/lib/route_helpers"

##########
# ROUTES #
##########

app.get '/', (requireController 'landing').index

Users    = requireController 'users'
Promises = requireController 'promises'

namespace 'api', ({ get, post }) ->
  get  '/users/:id', Users.show
  post '/users', Users.create
  post '/promises', Promises.create
