ConfigurationStore  = require '../stores/ConfigurationStore'
BaseComponent       = require './BaseComponent'
FormComponent       = require './FormComponent'
IndexComponent      = require './index/IndexComponent'
LoadingComponent    = require './LoadingComponent/LoadingComponent'

require '!style!css!../vendor/stylesheets/bootstrap/bootstrap'
require '!style!css!../vendor/stylesheets/react-select'
require '!style!css!../vendor/stylesheets/vis/vis'
require '!style!css!../vendor/stylesheets/font-awesome/font-awesome'
require '!style!css!stylus!./base'

class AppComponent extends BaseComponent
  
  dependsOnStores: [ConfigurationStore]

  getState: ->
    step: ConfigurationStore.step
    message: ConfigurationStore.message
    list: ConfigurationStore.list
    automatonSize: ConfigurationStore.automatonSize
    abcSize: ConfigurationStore.abcSize

  render: ->
    <div className='container'>
      {
        switch @state.step
          when 'form'
            <FormComponent />
          when 'loading'
            <LoadingComponent message=@state.message />
          when 'index'
            <IndexComponent />
      }
    </div>

module.exports = AppComponent