ConfigurationActionCreator = require '../actions/ConfigurationActionCreator'
Select                     = require 'react-select'
BaseComponent              = require './BaseComponent'

max = 1e7
class FormComponent extends BaseComponent

  constructor: (props) ->
    super props

  automatonSizeOptions: =>
    _([2..7]).map (i) -> 
      {value: i, label: i}

  abcSizeOptions: =>
    a = [0, 0, 6, 6, 4, 4, 3, 2]
    
    _([2..a[@state.automatonSize]]).map (i) ->
      {value: i, label: "a-#{String.fromCharCode('a'.charCodeAt(0) + i - 1)} (#{i})"}

  handleForm: (e) =>
    e.preventDefault()
    if @state.automatonSize && @state.abcSize
      ConfigurationActionCreator.request @state.automatonSize, @state.abcSize

  handleSelect: (key, e) =>
    @setState "#{key}": e?.value

  # componentDidMount: ->
  #   ConfigurationActionCreator.request 2, 2  

  render: ->
    <form onSubmit=@handleForm>
      <div className='row'>
        <div className='col-md-6'>
          <Select value=@state.automatonSize 
                  options=@automatonSizeOptions()
                  placeholder='Automaton size'
                  onChange={_(@handleSelect).partial('automatonSize', _)} />
        </div>
        <div className='col-md-6'>
          <Select value=@state.abcSize 
                  options=@abcSizeOptions()
                  placeholder='ABC size'
                  onChange={_(@handleSelect).partial('abcSize', _)} />
        </div>
      </div>
      <br/>
      <button className='btn btn-primary'>{'Start'}</button>
    </form>
module.exports = FormComponent
