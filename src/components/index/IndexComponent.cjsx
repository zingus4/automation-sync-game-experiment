BaseComponent = require '../BaseComponent'
IndexTableComponent = require './IndexTableComponent'

class IndexComponent extends BaseComponent

  onFilterChange: (params) =>
    params = _.extend @state.requestParams, params
    @setState requestParams: params
    AnswerDatabaseActionCreator.getList params
    
  handlePageClick: (page) =>
    # because react-paginate trigger event on initial
    if page.selected + 1 != @state.meta.current_page 
      @onFilterChange page: page.selected + 1

  handleSortClick: (key, nextOrder)=>
    sortParam = {}
    newSortState = _.mapObject @state.sortState, (val, itemKey)->
      if key == itemKey
        sortParam = 
          by_field: [itemKey,nextOrder]
          page: 0
        {label: val.label, order: nextOrder} 
      else
        {label: val.label, order: 'none'}
    @onFilterChange sortParam
    @setState sortState: newSortState

  render: ->
    <div>
      <h4>{"Automaton size: #{@props.automatonSize}"}</h4>
      <h4>{"Alphabet size: #{@props.abcSize}"}</h4>
      <IndexTableComponent sortState=@state.sortState list=@state.list handleSortClick=@handleSortClick />
      <PaginationComponent pageNum={@state.meta.total_pages} handlePageClick={@handlePageClick} initialSelected={@state.meta.current_page - 1} />
    </div>

module.exports = IndexComponent