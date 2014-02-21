HomeController = require 'controllers/home-controller'
LoggedView = require 'views/logged/logged-view'
BitsModel = require 'models/bits/bits'
ModalLoginView = require 'views/modal-login/modal-login-view'
util = require 'lib/util'

module.exports = class LoginController extends HomeController
  
  showLogin: ->
   @view = new ModalLoginView()

#


