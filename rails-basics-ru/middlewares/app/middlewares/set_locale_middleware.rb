# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call env
  end

  def _call(env)
    request = Rack::Request.new env
    locale = extract_locale request

    I18n.locale = locale if locale

    @app.call env
  end

  private

  def extract_locale(request)
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
  end
  # END
end
