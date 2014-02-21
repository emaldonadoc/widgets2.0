Application = require './application'
routes = require './routes'

# Initialize the application on DOM ready event.
$ ->
  new Application {routes, controllerSuffix: '-controller'}
  console.log 'step1'
  console.log 'step2'
#  Chaplin.utils.redirectTo controller:'home', action:'index'
