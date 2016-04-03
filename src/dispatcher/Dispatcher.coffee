class Dispatcher extends Flux.Dispatcher

  dispatch: (options) ->
    console.info options.type
    super options

module.exports = new Dispatcher()