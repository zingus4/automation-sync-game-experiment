# AuthStore = require '../stores/AuthStore'
BaseComponent = require './BaseComponent'
# # PusherActionCreator = require '../actions/PusherActionCreator'
# config = require '../config'
# ReactRouter = require 'react-router'
# InterfaceActionCreator = require '../actions/InterfaceActionCreator'
# ChannelsActionCreator = require '../actions/ChannelsActionCreator'

# require '!style!css!../vendor/stylesheets/react-select'
# require '!style!css!../vendor/stylesheets/react-datepicker'
# require '!style!css!stylus!../vendor/stylesheets/normalize'
# require '!style!css!../vendor/stylesheets/font-awesome/font-awesome'
# require '!style!css!autoprefixer!stylus!../assets/stylesheets/base'

# require '!style!css!../lib/pickmeup/base'
# require '!style!css!stylus!../lib/pickmeup/override'

class AppComponent extends BaseComponent
  
  render: ->
    <div>{@props.main}</div>

module.exports = AppComponent