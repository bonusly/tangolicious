require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Customer < Resource
    def self.accounts(id)
      request.get("#{endpoint}/#{id}/accounts")
    end

    def self.create(params)
      request.post(endpoint, params)
    end

    def self.create_account(id)
      request.post("#{endpoint}/#{id}/accounts", params)
    end

    def self.endpoint
      'customers'
    end
  end
end
