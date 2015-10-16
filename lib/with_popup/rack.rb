class WithPopup::Rack
  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env
    @status, @headers, @response = @app.call(env)
    return [@status, @headers, @response] unless need_injection?
    body = inject_js(@response.body)
    clear_param!
    [@status, @headers, [body]]
  end

  private

  def need_injection?
    @status == 200 && html? && popup_param
  end

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

  def inject_js(body)
    js = popup_param == :close ? close_popup_js : reload_popup_js
    body.sub('</body>', js + '</body>')
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
