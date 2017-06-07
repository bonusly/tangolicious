require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class CreditCard < Resource
    def self.register(params)
      new(request.post(endpoint, params))
    end

    def self.unregister(params)
      request.post('creditCardUnregisters', params)
    end

    def self.fund(params)
      request.post('creditCardDeposits', params)
    end

    def self.endpoint
      'creditCards'
    end
  end
end
