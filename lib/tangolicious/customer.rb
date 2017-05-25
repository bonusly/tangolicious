require 'tangolicious/request'

module Tangolicious
  class Customer < Request
    def self.all
      new.get('customers')
    end
  end
end
