require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Catalog < Resource
    def self.list
      response = request.get(endpoint)
      { brands: Brand.wrap(response['brands']), catalog_name: response['catalogName'] }
    end

    def self.endpoint
      'catalogs'
    end
  end
end
