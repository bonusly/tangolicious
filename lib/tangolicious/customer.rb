require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Customer < Resource
    class << self
      def accounts(id)
        new.request.get("#{endpoint}/#{id}/accounts")
      end

      def create(params)
        new.request.post(endpoint, params)
      end

      def create_account(id)
        new.request.post("#{endpoint}/#{id}/accounts", params)
      end

      private

      def endpoint
        'customers'
      end
    end
  end
end
