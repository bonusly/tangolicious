require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Catalog < Resource
    def self.list
      wrap(request.get(endpoint)['brands'])
    end

    def self.name
      request.get(endpoint)['catalogName']
    end

    def self.endpoint
      'catalogs'
    end
  end
end
