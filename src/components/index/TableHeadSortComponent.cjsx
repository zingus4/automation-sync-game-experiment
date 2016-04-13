BaseComponent               = require '../BaseComponent'
styles                      = require './styles'

class TableHeadSortComponent extends BaseComponent
  availableOrders: ['desc', 'none', 'asc']
  
  nextOrder: =>
    index = _.indexOf @availableOrders, @props.order
    nextIndex = if index == 2 then 0 else index + 1 
    @availableOrders[nextIndex]
    
  handleClick: =>
    @props.callback(@props.field, @nextOrder())

  render: ->
    <td className={styles.table_head_cell} onClick={@handleClick}>
      {@props.label}
      <div className={styles.sort_container}>
        {
          if @props.order == 'none'
            <div>
              <div className={styles.caret_up}>
                <i className="fa fa-caret-up"/>
              </div>
              <div className={styles.caret_down}>
                <i className="fa fa-caret-down"/>
              </div>
            </div>
          else if @props.order == "desc"
            <div className={styles.caret_up}>
              <i className="fa fa-caret-up"/>
            </div>
          else if @props.order == "asc"
            <div className={styles.caret_down}>
              <i className="fa fa-caret-down"/>
            </div>
        }
      </div>
    </td>

module.exports = TableHeadSortComponent