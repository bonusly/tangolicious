require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class CreditCard < Resource
    def self.register(params)
      new.post(endpoint, params)
    end

    def self.unregister(params)
      new.post('creditCardUnregisters', params)
    end

    def self.fund(params)
      new.post('creditCardDeposits', params)
    end

    def self.endpoint
      'creditCards'
    end
  end
end
