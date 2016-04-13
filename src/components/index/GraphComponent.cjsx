BaseComponent = require '../BaseComponent'
styles = require './styles'
ReactDom = require 'react-dom'
require 'script!../../vendor/js/vis/vis.js'

class GraphComponent extends BaseComponent

  draw: =>
    @a = _([1..@props.automatonSize]).map () => [1..@props.abcSize]
    current = @props.index
    _([0..@props.automatonSize - 1]).each (i) =>
      _([0..@props.abcSize - 1]).each (j) =>
        @a[i][j] = current % @props.automatonSize
        current =  Math.floor(current / @props.automatonSize)
    
    nodes = _([1..@props.automatonSize]).map (i) -> {id: i, label: i}
    edges = []
    _([0..@props.automatonSize - 1]).each (i) =>
      _([0..@props.abcSize - 1]).each (j) =>
        if i != @a[i][j]
          edge = from: i + 1, to: @a[i][j] + 1, arrows: 'to',  label: String.fromCharCode('a'.charCodeAt(0) + j)
          edges.push edge

    container = ReactDom.findDOMNode @refs.graph
    data =
      nodes: nodes
      edges: edges
    options = {}
    network = new vis.Network container, data, options

  componentDidMount: ->
    @draw()

  componentDidUpdate: ->
    @draw()

  render: ->
    <div ref='graph' className=styles.graph>
    </div>

module.exports = GraphComponent