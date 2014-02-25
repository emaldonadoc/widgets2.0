ModalLoginPageView = require 'views/modal-login/modal-login-view'

class ModalLoginPageViewTest

    describe 'Should do login', ->
        beforeEach ->
            @view = new ModalLoginPageViewTest
            
        afterEach ->
            @view.dispose()

        it 'do login', ->
            @view.$el('#wbi-login-btn').click()

