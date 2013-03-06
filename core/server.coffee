{APP_ROOT} = process.env

cache        = require "#{ APP_ROOT }/core/lib/app"
express      = require 'express'

app = express()
cache.set(app)

app.configure ->
  app.set "port", 3000

  app.use express.static "#{ APP_ROOT }/public"
  app.use express.favicon()
  app.use express.methodOverride()
  app.use express.cookieParser("seCret")
  app.use express.session()

  app.use express.bodyParser()
  app.use app.router

app.configure "development", ->
  app.use express.errorHandler()

require './routes'

app.listen(app.get('port'))
