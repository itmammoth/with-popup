module WithPopup
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    config.app_middleware.use 'WithPopup::Rack'

    initializer 'with_popup.include_modules' do
      ActiveSupport.on_load :action_controller do
        include WithPopup::Controller
      end
      ActiveSupport.on_load :action_view do
        include WithPopup::Helpers::FormTagHelper
        ActionView::Helpers::FormBuilder.class_eval do
          include WithPopup::Helpers::FormHelper
        end
      end
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.assets false
      g.helper false
    end
  end
end
