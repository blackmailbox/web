{APP_ROOT} = process.env

app = do require "#{ APP_ROOT }/core/lib/app"

{requireController, namespace} = require "#{ APP_ROOT }/core/lib/route_helpers"

##########
# ROUTES #
##########

app.get '/', (requireController 'landing').index

namespace 'api', ({ get }) ->
  get '/users', (requireController 'users').index
  get '/promises', (requireController 'promises').index
