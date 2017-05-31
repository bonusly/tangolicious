require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Catalog < Resource
    def self.list
      wrap(new.request.get(endpoint)['brands'])
    end

    def self.name
      new.request.get(endpoint)['catalogName']
    end

    def self.endpoint
      'catalogs'
    end
  end
end
