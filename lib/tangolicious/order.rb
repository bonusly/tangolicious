require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Order < Resource
    def self.list
      response = request.get(endpoint)
      { page: response['page'], orders: self.wrap(response['orders']) }
    end

    def self.resend(id)
      request.post("#{endpoint}/#{id}/resends")
    end

    def self.create(params)
      new(request.post(endpoint, params))
    end

    def self.endpoint
      'orders'
    end
  end
end
