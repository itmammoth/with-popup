module WithPopup
  module TestHelpers
    module Controller
      def with_popup_reloading_path
        session[:_with_popup] == :close ? nil : session[:_with_popup]
      end

      def with_popup_is_closing?
        session[:_with_popup] == :close
      end
    end
  end
end