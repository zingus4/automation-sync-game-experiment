BaseComponent = require '../BaseComponent'
styles = require './styles'
ReactDom = require 'react-dom'
require 'script!../../vendor/js/vis/vis.js'

class GraphComponent extends BaseComponent

  draw: =>    
    nodes = _([1..@props.automatonSize]).map (i) -> {id: i, label: i}
    edges = []

    loops = _([0..@props.automatonSize - 1]).map -> ''
    _([0..@props.abcSize - 1]).each (j) =>
      _([0..@props.automatonSize - 1]).each (i) =>
        current = @props.a[j][i]
        fromChar = String.fromCharCode 'a'.charCodeAt(0) + j
        toChar = String.fromCharCode '0'.charCodeAt(0) + current[1]
        label = "#{fromChar}/#{toChar}"

        if i != current[0]
          edge = from: i + 1, to: current[0] + 1, arrows: 'to',  label: label
          edges.push edge
        else
          if loops[i] == ''
            loops[i] = label
          else
            loops[i] = "#{loops[i]}, #{label}"

    _(loops).each (item, i) =>
      if item != ''
        edge = from: i + 1, to: i + 1, arrows: 'to',  label: item
        edges.push edge

    # _([0..@props.automatonSize - 1]).each (i) =>
    #   a = _([0..@props.automatonSize - 1]).map -> ''
    #   _([0..@props.abcSize - 1]).each (j) =>
    #     a[@a[i][j]] += String.fromCharCode('a'.charCodeAt(0) + j)
    #   _(a).each (str, j) =>
    #     if (str.length > 0) && (i != j || @props.loopsEnabled)
    #       edge = from: i + 1, to: j + 1, arrows: 'to', label: str
    #       edges.push edge

      # _([0..@props.abcSize - 1]).each (j) =>
      #   if i != @a[i][j]
      #     edge = from: i + 1, to: @a[i][j] + 1, arrows: 'to',  label: String.fromCharCode('a'.charCodeAt(0) + j)
      #     edges.push edge

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