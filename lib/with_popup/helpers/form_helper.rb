module WithPopup
  module Helpers
    module FormHelper
      include WithPopup::Helpers::Util

      def submit_with_popup(value = nil, options = {})
        add_with_popup_option_to!(options)
        submit(value, options)
      end

      def button_with_popup(value = nil, options = {}, &block)
        add_with_popup_option_to!(options)
        button(value, options, &block)
      end
    end
  end
end
