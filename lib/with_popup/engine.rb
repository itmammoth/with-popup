require 'with_popup/controller.rb'

module WithPopup
  class Engine < ::Rails::Engine
    config.app_middleware.use 'WithPopup::Rack'
    initializer 'with_popup.action_controller_helpers' do
      ActiveSupport.on_load :action_controller do
        include WithPopup::Controller
      end
    end
  end
end
