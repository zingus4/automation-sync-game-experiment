Dispatcher = require '../dispatcher/Dispatcher'

class BaseStore extends EventEmitter

  constructor: () ->
    super()
    @register @_registerToActions

  register: (actionSubscribe) =>
    @dispatchToken = Dispatcher.register actionSubscribe

  emitChange: () =>
    @emit 'CHANGE'

  addChangeListener: (cb) =>
    @on 'CHANGE', cb

  removeChangeListener: (cb) =>
    @removeListener 'CHANGE', cb

module.exports = BaseStore