require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Customer < Resource
    def self.accounts(id)
      new.request.get("#{endpoint}/#{id}/accounts")
    end

    def self.create(params)
      new.request.post(endpoint, params)
    end

    def self.create_account(id)
      new.request.post("#{endpoint}/#{id}/accounts", params)
    end

    def self.endpoint
      'customers'
    end
  end
end
