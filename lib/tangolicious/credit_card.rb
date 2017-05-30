require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class CreditCard < Resource
    class << self
      def register(params)
        new.post(endpoint, params)
      end

      def unregister(params)
        new.post('creditCardUnregisters', params)
      end

      def fund(params)
        new.post('creditCardDeposits', params)
      end

      private

      def endpoint
        'creditCards'
      end
    end
  end
end
