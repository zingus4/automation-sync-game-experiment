BaseComponent = require '../BaseComponent'
TableHeadSortComponent = require './TableHeadSortComponent'
GraphComponent = require './GraphComponent'
styles = require './styles'

class IndexTableComponent extends BaseComponent

  render: ->
    <table className='table table-bordered'>
      <thead>
        <tr>
          <td />
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
              <td className=styles.graph>
                <GraphComponent index=item.index automatonSize=@props.automatonSize abcSize=@props.abcSize />
              </td>
              <td>{item.index}</td>
              <td>{if item.win then 'yes' else 'no'}</td>
              <td>{item.length}</td>
              <td>{item.first_step}</td>
            </tr>
        }
      </tbody>
    </table>

module.exports = IndexTableComponent