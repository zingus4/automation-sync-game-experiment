ConfigurationActionCreator = require '../actions/ConfigurationActionCreator'
Select                     = require 'react-select'
BaseComponent              = require './BaseComponent'

class FormComponent extends BaseComponent

  constructor: (props) ->
    super props

  automatonSizeOptions: =>
    _([3..8]).map (i) -> 
      {value: i, label: i}

  # abcSizeOptions: =>
  #   a = [0, 0, 4, 4, 4, 4, 3, 2]
    
  #   _([2..a[@state.automatonSize]]).map (i) ->
  #     {value: i, label: "a-#{String.fromCharCode('a'.charCodeAt(0) + i - 1)} (#{i})"}

  handleForm: (e) =>
    e.preventDefault()
    # if @state.automatonSize && @state.abcSize
    ConfigurationActionCreator.request @state.automatonSize, @state.abcSize, @state.bottom

  handleSelect: (key, e) =>
    @setState "#{key}": e?.value

  handleBottoms: =>
    @setState bottom: !@state.bottom

  render: ->
    <form onSubmit=@handleForm>
      <div className='row'>
        <div className='col-md-12'>
          <Select value=@state.automatonSize 
                  options=@automatonSizeOptions()
                  placeholder='Series'
                  onChange={_(@handleSelect).partial('automatonSize', _)} />
        </div>
      </div>
      <br/>
      <button className='btn btn-primary'>{'Start'}</button>
    </form>

module.exports = FormComponent
