module HeadersCleaner
  class Rack

    def initialize(app, opts = {})
      @app = app
      @to_remove_headers = HeadersCleaner::SENSITIVE_HEADERS - opts.fetch(:whitelisted, [])
    end

    def call(env)
      status, headers, body = @app.call(env)
      @to_remove_headers.each { |key| headers.delete(key) }
      [status, headers, body]
    end

  end
end
