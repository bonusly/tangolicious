require 'tangolicious/version'

module Tangolicious

  @api_base = 'https://integration-api.tangocard.com/raas/v2/'

  class << self
    attr_accessor :platform_name, :platform_key, :api_base
  end
end
