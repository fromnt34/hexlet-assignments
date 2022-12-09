# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = response = @app.call(env)

    return response if status != 200

    [status, headers, body << Digest::SHA2.hexdigest(body.join)]
    # END
  end
end
