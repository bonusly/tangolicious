require 'tangolicious/request'

module Tangolicious
  class Account < Request
    class << self
      def list
        new.get(endpoint)
      end

      def retrieve(id)
        new.get("#{endpoint}/#{id}")
      end

      private

      def endpoint
        'accounts'
      end
    end
  end
end
