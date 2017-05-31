require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Account < Resource
    def self.endpoint
      'accounts'
    end
  end
end
