BaseComponent = require '../BaseComponent'
TableHeadSortComponent = require './TableHeadSortComponent'
GraphComponent = require './GraphComponent'
styles = require './styles'

class IndexTableComponent extends BaseComponent

  handleLoops: =>
    @setState loopsEnabled: !@state.loopsEnabled

  render: ->
    <table className='table table-bordered'>
      <thead>
        <tr>
          <td className=styles.td_loop >
            <input  type='checkbox'
                    value=@state.loopsEnabled
                    id='loop'
                    onChange=@handleLoops
            />
            <label htmlFor='loop' className=styles.td_label>{'Loops enabled'}</label>
          </td>
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
              <td>
                <GraphComponent index=item.index automatonSize=@props.automatonSize abcSize=@props.abcSize loopsEnabled=@state.loopsEnabled />
              </td>
              <td>{item.index}</td>
              <td>{if item.win then 'yes' else 'no'}</td>
              <td>{item.length}</td>
              <td>{String.fromCharCode('a'.charCodeAt(0) + item.first_step)}</td>
            </tr>
        }
      </tbody>
    </table>

module.exports = IndexTableComponent