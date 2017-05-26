require 'tangolicious/request'

module Tangolicious
  class Order < Request
    class << self
      def list
        new.get(endpoint)
      end

      def retrieve(id)
        new.get("#{endpoint}/#{id}")
      end

      def create(params)
        new.post(endpoint, params)
      end

      def resend(params)
        new.post("#{endpoint}/#{id}/resends", params)
      end

      def endpoint
        'orders'
      end
    end
  end
end
