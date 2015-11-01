module WithPopup
  module Helpers
    module Util
      private
      def add_with_popup_option_to!(options)
        options["data-with-popup"] = true
        if options[:with_popup]
          options["data-with-popup-src"] = options[:with_popup][:src]
          options["data-with-popup-features"] = options[:with_popup][:features]
        end
      end
    end
  end
end
