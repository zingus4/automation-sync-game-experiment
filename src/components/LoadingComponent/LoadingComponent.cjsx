BaseComponent = require '../BaseComponent'
styles        = require './styles'

class LoadingComponent extends BaseComponent

  render: ->
    <div>
      <div className=styles.loader>
        <img src='/loader.svg'/>
      </div>
      <div className=styles.message>{@props.message}</div>
    </div>

module.exports = LoadingComponent