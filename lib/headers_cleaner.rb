require 'headers_cleaner/version'
require 'headers_cleaner/rack'

module HeadersCleaner

  def self.middleware
    HeadersCleaner::Rack
  end

end
