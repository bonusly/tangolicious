require 'tangolicious/version'
require 'tangolicious/customer'
require 'tangolicious/account'
require 'tangolicious/credit_card'
require 'tangolicious/catalog'
require 'tangolicious/order'

module Tangolicious

  @api_base = 'https://integration-api.tangocard.com/raas/v2/'

  class << self
    attr_accessor :platform_name, :platform_key, :api_base
  end
end
