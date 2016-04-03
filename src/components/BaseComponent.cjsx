class BaseComponent extends React.Component

  constructor: (props) ->
    super props
    @state = @getState()

  componentDidMount: ->
    _(@dependsOnStores).each (store, index) =>
      store.addChangeListener @_onChange

  componentWillUnmount: ->
    _(@dependsOnStores).each (store, index) =>
      store.removeChangeListener @_onChange

  _onChange: =>
    @setState @getState()

  dependsOnStores: []

  getState: -> {}

module.exports = BaseComponent