require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Catalog < Resource
    class << self
      def list
        wrap(new.request.get(endpoint)['brands'])
      end

      def name
        new.request.get(endpoint)['catalogName']
      end

      def endpoint
        'catalogs'
      end
    end
  end
end
