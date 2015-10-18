module WithPopup::Helpers::FormTagHelper
  include WithPopup::Helpers::Util

  def submit_with_popup_tag(value = 'Save changes', options = {})
    add_with_popup_option_to!(options)
    submit_tag(value, options)
  end

  def image_submit_with_popup_tag(source, options = {})
    add_with_popup_option_to!(options)
    image_submit_tag(source, options)
  end

  def button_with_popup_tag(content_or_options = nil, options = {}, &block)
    add_with_popup_option_to!(options)
    button_tag(content_or_options, options, &block)
  end

  def button_with_popup_to(name = nil, options = nil, html_options = {}, &block)
    add_with_popup_option_to!(html_options)
    button_to(name, options, html_options, &block)
  end

  def link_with_popup_to(name = nil, options = nil, html_options = {}, &block)
    add_with_popup_option_to!(html_options)
    link_to(name, options, html_options, &block)
  end

  def link_with_popup_to_if(condition, name, options = {}, html_options = {}, &block)
    add_with_popup_option_to!(html_options)
    link_to_if(condition, name, options, html_options, &block)
  end

  def link_with_popup_to_unless(condition, name, options = {}, html_options = {}, &block)
    add_with_popup_option_to!(html_options)
    link_to_unless(condition, name, options, html_options, &block)
  end

  def link_with_popup_to_unless_current(name, options = {}, html_options = {}, &block)
    add_with_popup_option_to!(html_options)
    link_to_unless_current(name, options, html_options, &block)
  end
end
