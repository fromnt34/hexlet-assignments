# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call env

    if status == 404
      path = headers[:'x-path']

      if path.start_with? '/admin'
        [403, headers]
      else
        [status, headers, body]
      end
    else
      [status, headers, body]
    end
    # END
  end
end
