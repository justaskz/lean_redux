require 'dry/struct'

module LeanRedux
  class UndefinedActionError < StandardError
    def message
      'Action is not defined in the state map'
    end
  end

  module Types
    include Dry.Types()
  end
end

Dir["#{__dir__}/**/*.rb"].each { |file| require file }
