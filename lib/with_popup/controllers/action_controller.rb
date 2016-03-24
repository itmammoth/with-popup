module WithPopup
  module Controllers
    module ActionController
      def close_popup
        session[:_with_popup] = :close
      end

      def reload_popup(path)
        session[:_with_popup] = path
      end
    end
  end
end
