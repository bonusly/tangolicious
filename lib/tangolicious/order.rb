require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Order < Resource
    def self.resend(params)
      request.post("#{endpoint}/#{id}/resends", params)
    end

    def self.create(params)
      request.post(endpoint, params)
    end

    def self.endpoint
      'orders'
    end
  end
end
