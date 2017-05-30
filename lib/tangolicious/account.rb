require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Account < Resource
    class << self
      private

      def endpoint
        'accounts'
      end
    end
  end
end
