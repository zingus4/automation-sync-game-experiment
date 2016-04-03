BaseStore = require './BaseStore'
config = require '../config'
ActionTypes = require '../constants/action_types'

class ChannelsStore extends BaseStore

  constructor: ->
    @chatList = []
    @list = []
    super()

  _setList: (list) =>
    InterfaceStore = require('./InterfaceStore')
    object = InterfaceStore.editing.object
    selected = InterfaceStore.channels.selected
    @list = list
    if selected
      InterfaceStore.channels.selected = _(@list).findIndex (channel) ->
        channel.id == object.id
      InterfaceStore.emitChange()

  _registerToActions: (payload) =>
    switch payload.type
      when ActionTypes.CHANNELS_INDEX_INITIALIZE
        @chatList = payload.params.list
        @emitChange()

      when ActionTypes.SELECT_TAB, ActionTypes.SELECT_MENU_ITEM
        @list = []
        @loading = yes
        @error = undefined
        @emitChange()
      when ActionTypes.CHANNELS_INDEX_SUCCESS, ActionTypes.EDITING_LOAD_MORE
        @_setList payload.params.list
        @loading = no
        @error = undefined
        @emitChange()
      when ActionTypes.CHANNELS_INDEX_FAILURE
        @error = payload.params.error
        @loading = no
        @emitChange()
      when ActionTypes.UPDATE_CHANNEL
        channel = payload.params
        index = _(@list).findIndex (obj) ->
          obj.id == channel.id
        @list[index] = channel
        @emitChange()
      when ActionTypes.CREATE_CHANNEL
        channel = payload.params
        @list.push channel
        @emitChange()

module.exports = new ChannelsStore()