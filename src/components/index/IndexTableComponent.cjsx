BaseComponent = require '../BaseComponent'

class IndexTableComponent extends BaseComponent

  render: ->
    <table className='table table-bordered'>
      <thead>
        <tr>
          {
            for key, value of @props.sortState
              <TableHeadSortComponent label={value.label} callback={@props.handleSortClick} field={key} key={key} order={value.order}/>
          }
        </tr>
      </thead>
      <tbody>
        {
          for item, index in @props.list
            <tr key={index}>
              <td>{item}</td>
            </tr>
        }
      </tbody>
    </table>

module.exports = IndexTableComponent