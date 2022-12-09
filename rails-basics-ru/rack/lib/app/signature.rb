# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call env

    [status, headers, body << Digest::SHA2.hexdigest(body[0])]
    # END
  end
end
