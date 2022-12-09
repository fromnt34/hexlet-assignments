# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    runtime = Rack::Runtime.new @app
    runtime.call env
  end
end
