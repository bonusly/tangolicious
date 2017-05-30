require 'tangolicious/request'

module Tangolicious
  class Customer < Request
    class << self
      def list
        new.get(endpoint)
      end

      def accounts(id)
        new.get("#{endpoint}/#{id}/accounts")
      end

      def create(params)
        new.post(endpoint, params)
      end

      def create_account(id)
        new.post("#{endpoint}/#{id}/accounts", params)
      end

      private

      def endpoint
        'customers'
      end
    end
  end
end
