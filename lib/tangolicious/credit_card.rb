require 'tangolicious/request'

module Tangolicious
  class CreditCard < Request
    class << self
      def list
        new.get(endpoint)
      end

      def retrieve(id)
        new.get("#{endpoint}/#{id}")
      end

      def register(params)
        new.post(endpoint, params)
      end

      def unregister(params)
        new.post('creditCardUnregisters', params)
      end

      def fund(params)
        new.post('creditCardDeposits', params)
      end

      def endpoint
        'creditCards'
      end
    end
  end
end
