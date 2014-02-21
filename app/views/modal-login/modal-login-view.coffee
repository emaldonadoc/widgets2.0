View = require 'views/base/view'

module.exports = class ModalLoginPageView extends View
  container: 'main'
  tagName: 'main'
  className: 'login-modal-body'
  autoRender: true
  template: require './templates/modal-login'
  autoAttach: true
  events:
    'click #wbi-login-btn': 'doLogin'

  initialize: ->
   super
   $('.wb-main').remove()

  doLogin: (e) ->
    e.preventDefault
    console.log 'Do login'