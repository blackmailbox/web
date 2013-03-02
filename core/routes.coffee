{APP_ROOT} = process.env

requireController = (component) ->
  require "#{ APP_ROOT }/components/#{ component }/controller"


module.exports = (app) ->
  app.get '/', (requireController 'landing').index