#application = require('Application')
#application.initialize()

tests = [
  './views/header-view-test'
  './views/modal-login-page-view-test'
]

for test in tests
    require test
