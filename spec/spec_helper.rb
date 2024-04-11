require 'bundler/setup'

require 'lean_redux'

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.verify_partial_doubles = true
  end
end
