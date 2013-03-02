{APP_ROOT} = process.env

express = require 'express'
initializers = require "#{ APP_ROOT }/core/config/initializers"

app = express()

app.set "port", 3000
app.use app.router
app.use express.static "#{ APP_ROOT }/public"

app.use express.favicon()
app.use express.logger("dev")
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser("seCret")
app.use express.session()

app.configure "development", ->
  app.use express.errorHandler()

routes = (require './routes')(app)
initializers.run()

app.listen(app.get('port'))
