{APP_ROOT} = process.env

cache        = require "#{ APP_ROOT }/core/lib/instance_cache"
express      = require 'express'
initializers = require "#{ APP_ROOT }/core/config/initializers"

app = express()
cache.set(app)

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

require './routes'
initializers.run()

app.listen(app.get('port'))
