module WithPopup::Controller
  def close_popup
    session[:_with_popup] = :close
  end

  def reload_popup(path)
    session[:_with_popup] = path
  end
end
