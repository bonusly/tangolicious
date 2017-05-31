require 'tangolicious/request'
require 'tangolicious/resource'

module Tangolicious
  class Order < Resource
    def self.resend(params)
      new.post("#{endpoint}/#{id}/resends", params)
    end

    def self.create(params)
      # bad_params = params.keys - allowed_create_params
      # raise "Invalid param: #{}" unless
      new.request.post(endpoint, params)
    end

    # def self.allowed_create_params
    #   %i[account_identifier amount campaign customer_identifier email_subject external_ref_id message notes recipient send_email sender utid]
    # end
    #
    # def self.required_create_params
    #   %i[account_identifier amount customer_identifier utid]
    # end

    def self.endpoint
      'orders'
    end
  end
end
