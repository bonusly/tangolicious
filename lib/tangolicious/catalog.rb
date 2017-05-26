require 'tangolicious/request'

module Tangolicious
  class Catalog < Request
    class << self
      def list
        new.get(endpoint)
      end

      def endpoint
        'catalogs'
      end
    end
  end
end
