Dispatcher = require '../dispatcher/Dispatcher'
ActionTypes = require '../constants/action_types'

ConfigurationActionCreator =
  
  request: (automatonSize, abcSize) ->
    Dispatcher.dispatch
      type: ActionTypes.REQUEST
      params:
        automatonSize: automatonSize
        abcSize: abcSize

module.exports = ConfigurationActionCreator