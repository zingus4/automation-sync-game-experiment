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
        @list = _(@data).first(10)
        @meta =
          current_page: 1
          total_pages: Math.ceil(@data.length / 10)
        @emitChange()
      when ActionTypes.GET_LIST
        console.log payload.params
        if payload.params.by_field
          field = payload.params.by_field[0]
          direction = payload.params.by_field[1]
          if direction == 'none'
            field = 'index'
            direction = 'asc'
          @data = _(@data).sortBy (item) ->
            item[field] || ''
          if direction != 'asc'
            @data = _(@data).reverse()
          @list = _(@data).first(10)
          @meta.current_page = 1
        if payload.params.page != 0 && payload.params.page != @meta.current_page
          @meta.current_page = payload.params.page
          @list = _(@data).slice(10 * (@meta.current_page - 1), 10 * @meta.current_page)
        @emitChange()

module.exports = new ConfigurationStore()