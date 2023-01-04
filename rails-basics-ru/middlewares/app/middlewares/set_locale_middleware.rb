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

    if locale
      formated_locale = locale.downcase.to_sym

      I18n.locale = I18n.available_locales.include?(formated_locale) ? formated_locale : I18n.default_locale
    end

    @app.call env
  end

  private

  def extract_locale(request)
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
  end
  # END
end
