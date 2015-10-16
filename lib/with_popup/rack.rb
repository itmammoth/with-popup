class WithPopup::Rack
  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env
    @status, @headers, @response = @app.call(env)
    return [@status, @headers, @response] unless @status == 200 && html? && popup_param
    body = @response.body.sub('</body>', script_for_insertion + '</body>')
    clear_param!
    [@status, @headers, [body]]
  end

  private

  def html?
    @headers["Content-Type"].try(:include?, "text/html")
  end

  def popup_param
    session[:_with_popup]
  end

  def session
    @env['rack.session']
  end

  def clear_param!
    session.delete :_with_popup
  end

  def script_for_insertion
    if popup_param == :close
      close_popup_js
    else
      reload_popup_js
    end
  end

  def close_popup_js
    <<-JS
      <script type="text/javascript">
        var popup = open('', 'withPopup');
        popup && popup.close();
      </script>
    JS
  end

  def reload_popup_js
    <<-JS
      <script type="text/javascript">
        var popup = open('', 'withPopup');
        popup && (popup.location.href = '#{popup_param}');
      </script>
    JS
  end
end
