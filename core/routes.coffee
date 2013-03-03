{APP_ROOT} = process.env

requireController = (component) ->
  require "#{ APP_ROOT }/components/#{ component }/controller"


module.exports = (app) ->
  app.get '/', (requireController 'landing').index

  app.get '/users', (requireController 'users').index

  app.get '/promises', (requireController 'promises').index
