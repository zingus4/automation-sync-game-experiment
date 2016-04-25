BaseComponent = require '../BaseComponent'
IndexTableComponent = require './IndexTableComponent'
# LoadingComponent = require '../LoadingComponent/LoadingComponent'
PaginationComponent = require './PaginationComponent'
ConfigurationStore           = require '../../stores/ConfigurationStore'
ConfigurationActionCreator = require '../../actions/ConfigurationActionCreator'

class IndexComponent extends BaseComponent

  constructor: (props) ->
    super props
    @state.requestParams = {}
    @state.sortState = 
      title: 
        label: 'index'
        order: 'asc'
      win: 
        label: 'win'
        order: 'none'
      length: 
        label: 'the shortest way to win'
        order: 'none'
      first_step: 
        label: 'first step to win'
        order: 'none'

  getState: ->
    list: ConfigurationStore.list
    meta: ConfigurationStore.meta
    automatonSize: ConfigurationStore.automatonSize
    abcSize: ConfigurationStore.abcSize

  dependsOnStores: [ConfigurationStore]

  onFilterChange: (params) =>
    params = _.extend @state.requestParams, params
    @setState requestParams: params
    ConfigurationActionCreator.getList params
    
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
      <h4>{"Automaton size: #{@state.automatonSize}"}</h4>
      <h4>{"Alphabet size: #{@state.abcSize}"}</h4>
      <IndexTableComponent sortState=@state.sortState list=@state.list handleSortClick=@handleSortClick automatonSize=@state.automatonSize abcSize=@state.abcSize />
      <PaginationComponent pageNum={@state.meta.total_pages} handlePageClick={@handlePageClick} forceSelected={@state.meta.current_page - 1} />
    </div>

module.exports = IndexComponent