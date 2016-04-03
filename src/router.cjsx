{Redirect, IndexRedirect, Route, Router}             = require 'react-router'
createBrowserHistory                                 = require 'history/lib/createBrowserHistory'
BaseComponent                                        = require './components/BaseComponent'
AppComponent                                         = require './components/AppComponent'

class AppRouter extends BaseComponent

  render: ->
    window.browserHistory = history = createBrowserHistory()
    <Router history={history} >
      <Route path="/" component={AppComponent}/>
    </Router>

module.exports = AppRouter