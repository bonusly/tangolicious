require 'tangolicious/request'

module Tangolicious
  class Customer < Request
    class << self
      def all
        new.get(endpoint)
      end

      def accounts(customer_id)
        new.get("#{endpoint}/#{customer_id}/accounts")
      end

      def endpoint
        'customers'
      end
    end
  end
end
