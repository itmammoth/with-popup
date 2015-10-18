module WithPopup
  module Helpers
    module Util
      private
      def add_with_popup_option_to!(options)
        options["data-with-popup"] = true
        options["data-with-popup-features"] = options[:popup_features]
      end
    end
  end
end
