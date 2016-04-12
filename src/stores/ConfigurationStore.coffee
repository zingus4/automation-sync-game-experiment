BaseStore = require './BaseStore'
ActionTypes = require '../constants/action_types'

class ConfigurationStore extends BaseStore
  
  constructor: () ->
    super()
    @step = 'form'
    
  _registerToActions: (payload) =>
    switch payload.type
      when ActionTypes.REQUEST
        @step = 'loading'
        @message = 'Automatons are being builded'
        @emitChange()

module.exports = new ConfigurationStore()