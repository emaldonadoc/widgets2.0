View = require 'views/base/view'
util = require 'lib/util'
config = require 'config'

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
    $form = Winbits.$('#loginForm')
    console.log ['forma', $form.serializeArray()]
    formData = verticalId: 1
    formData = util.serializeForm($form, formData)
    console.log [formData]

    if util.validateForm($form)
      submitButton = @$(e.currentTarget).prop('disabled', true)
      that=@
      console.log ('DO LOGIN!!!!')
      util.ajaxRequest(
        config.apiUrl + "/users/login.json",
        type: "POST"
        contentType: "application/json"
        dataType: "json"
        data: JSON.stringify(formData)
        headers:
          "Accept-Language": "es"
        success: (data) ->
           console.log 'login success'
           Chaplin.utils.redirectTo controller: 'logged', action: 'showLogged'
        error: (xhr) ->
           console.log 'login error'
           alert 'login error'
        complete: ->
          submitButton.prop('disabled', false)
      )
