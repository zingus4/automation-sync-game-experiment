ConfigurationStore  = require '../stores/ConfigurationStore'
BaseComponent       = require './BaseComponent'
FormComponent       = require './FormComponent'
LoadingComponent    = require './LoadingComponent/LoadingComponent'

require '!style!css!../vendor/stylesheets/bootstrap/bootstrap'
require '!style!css!../vendor/stylesheets/react-select'
require '!style!css!../vendor/stylesheets/vis/vis'
require '!style!css!stylus!./base'

require 'script!../vendor/js/vis/vis.js'

class AppComponent extends BaseComponent
  
  dependsOnStores: [ConfigurationStore]

  getState: ->
    step: ConfigurationStore.step
    message: ConfigurationStore.message

  render: ->
    <div className='container'>
      {
        switch @state.step
          when 'form'
            <FormComponent />
          when 'loading'
            <LoadingComponent message=@state.message />
      }
    </div>

module.exports = AppComponent