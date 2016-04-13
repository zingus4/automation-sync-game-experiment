Dispatcher    = require '../dispatcher/Dispatcher'
ActionTypes   = require '../constants/action_types'

ConfigurationActionCreator =

  getList: (params = {}) ->
    Dispatcher.dispatch
      type: ActionTypes.GET_LIST
      params: params
    
  
  request: (automatonSize, abcSize) ->
    Dispatcher.dispatch
      type: ActionTypes.REQUEST
      params:
        automatonSize: automatonSize
        abcSize: abcSize
    $.getJSON "/data/#{automatonSize}-#{abcSize}.json", (data) ->
      Dispatcher.dispatch
        type: ActionTypes.AUTOMATONS_INDEX
        params:
          data: data

module.exports = ConfigurationActionCreator