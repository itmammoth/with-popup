module WithPopup
  module Helpers
    extend ActiveSupport::Autoload
    autoload :Util

    autoload :FormTagHelper
    autoload :FormHelper
    include FormTagHelper
    include FormHelper
  end
end