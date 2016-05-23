ConfigurationActionCreator = require '../actions/ConfigurationActionCreator'
Select                     = require 'react-select'
BaseComponent              = require './BaseComponent'

class FormComponent extends BaseComponent

  constructor: (props) ->
    super props

  automatonSizeOptions: =>
    _([2..7]).map (i) -> 
      {value: i, label: i}

  abcSizeOptions: =>
    a = [0, 0, 4, 4, 4, 4, 3, 2]
    
    _([2..a[@state.automatonSize]]).map (i) ->
      {value: i, label: "a-#{String.fromCharCode('a'.charCodeAt(0) + i - 1)} (#{i})"}

  handleForm: (e) =>
    e.preventDefault()
    if @state.automatonSize && @state.abcSize
      ConfigurationActionCreator.request @state.automatonSize, @state.abcSize, @state.bottom

  handleSelect: (key, e) =>
    @setState "#{key}": e?.value

  handleBottoms: =>
    @setState bottom: !@state.bottom

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
        <div className='col-md-2'>
            <input  type='checkbox'
                    value=@state.bottom
                    id='bottom'
                    onChange=@handleBottoms
            />
            {' '}
            <label htmlFor='bottom'>{'With bottom'}</label>
        </div>
      </div>
      <br/>
      <button className='btn btn-primary'>{'Start'}</button>
    </form>
module.exports = FormComponent
