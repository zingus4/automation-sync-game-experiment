BaseComponent = require '../BaseComponent'
styles = require './styles'
ReactDom = require 'react-dom'
require 'script!../../vendor/js/vis/vis.js'

class GraphComponent extends BaseComponent

  draw: =>
    return if @props.index != 0
    @a = _([1..@props.automatonSize]).map () => [1..@props.abcSize]
    current = @props.index
    _([0..@props.automatonSize - 1]).each (i) =>
      _([0..@props.abcSize - 1]).each (j) =>
        @a[i][j] = current % @props.automatonSize
        current =  Math.floor(current / @props.automatonSize)
    
    # nodes = new vis.DataSet(_([1..@props.automatonSize]).map (i) -> {id: i, label: i})
    nodes = _([1..@props.automatonSize]).map (i) -> {id: i + 1, label: i}
    # nodes = [
    #   {id: 1, label: 'Node 1'},
    #   {id: 2, label: 'Node 2'},
    #   {id: 3, label: 'Node 3:\nLeft-Aligned', font: {'face': 'Monospace', align: 'left'}},
    #   {id: 4, label: 'Node 4'},
    #   {id: 5, label: 'Node 5\nLeft-Aligned box', shape: 'box', font: {'face': 'Monospace', align: 'left'}}
    # ];

    console.log @a
    edges = []
    _([0..@props.automatonSize - 1]).each (i) =>
      _([0..@props.abcSize - 1]).each (j) =>
        # if i == @a[i][j]
        edge = from: i + 1, to: @a[i][j] + 1, arrows: 'to',  label: "#{j}"
        edges.push edge
    # console.error @props.index
    console.log edges
    # edges = new vis.DataSet edges
    edges = [
      {from: 1, to: 1, label: "1asdf", arrows: 'to'},
      {from: 2, to: 2, label: "3fasdf", arrows: 'to'},
      {from: 3, to: 2, label: "5ccc", arrows: 'to'},
      {from: 3, to: 1, label: "6vvv", arrows: 'to'}
    ];
    # console.warn edges

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