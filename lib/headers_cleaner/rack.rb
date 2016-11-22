module HeadersCleaner
  class Rack

    SENSITIVE_HEADERS = %w(Server X-Runtime X-Powered-By).freeze
    private_constant(:SENSITIVE_HEADERS)

    def initialize(app, opts = {})
      @app = app
      @to_remove_headers = opts.fetch(:remove, SENSITIVE_HEADERS)
    end

    def call(env)
      status, headers, body = @app.call(env)
      @to_remove_headers.each { |key| headers.delete(key) }

      # Define fake server
      # because some server (e.g. thin reset server)
      # https://github.com/macournoyer/thin/commit/617fccf7f7e1ee93671e8905623852e23fcc296c
      headers['Server'] = '42'

      [status, headers, body]
    end

  end
end
