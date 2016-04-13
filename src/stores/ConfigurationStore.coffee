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
        @automatonSize = payload.params.automatonSize
        @abcSize = payload.params.abcSize
        @emitChange()
      when ActionTypes.AUTOMATONS_INDEX
        @step = 'index'
        @data = payload.params.data
        @emitChange()

module.exports = new ConfigurationStore()