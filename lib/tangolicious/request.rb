require 'httparty'
require 'active_support/inflector'
require 'addressable/uri'
require 'tangolicious/util'
require 'tangolicious/exceptions'

module Tangolicious
  class Request
    include Util

    def get(endpoint, params = {})
      response = parsed_response(HTTParty.get("#{Tangolicious.api_base}#{endpoint}?#{query_string(params)}",
                                              basic_auth: basic_auth))
      check_errors(response)
    end

    def post(endpoint, params = {})
      response = parsed_response(HTTParty.post("#{Tangolicious.api_base}#{endpoint}",
                                               basic_auth: basic_auth,
                                               body: camelize_keys(default_params.merge(params)).to_json,
                                               headers: headers))
      check_errors(response)
    end

    private

    def query_string(params)
      uri = Addressable::URI.new
      uri.query_values = camelize_keys(params)
      uri.query
    end

    def check_errors(response)
      return response if response.is_a?(Array)
      raise Exceptions::BadRequest.new(response) if response.fetch('httpCode', nil) == 400
      raise Exceptions::Unauthorized.new(response) if response.fetch('httpCode', nil) == 401
      raise Exceptions::InsufficientFunds.new(response) if response.fetch('httpCode', nil) == 402
      raise Exceptions::Forbidden.new(response) if response.fetch('httpCode', nil) == 403
      raise Exceptions::NotFound.new(response) if response.fetch('httpCode', nil) == 404
      raise Exceptions::UnprocessableEntity.new(response) if response.fetch('httpCode', nil) == 422
      raise Exceptions::InternalServiceError.new(response) if response.fetch('httpCode', nil) == 500
      raise Exceptions::ServiceUnavailable.new(response) if response.fetch('httpCode', nil) == 503
      response
    end

    def default_params
      {
        account_identifier: Tangolicious.account_identifier,
        customer_identifier: Tangolicious.customer_identifier
      }.compact
    end

    def camelize_keys(attributes)
      call_recursively(attributes, :tangocard_camelize)
    end

    def tangocard_camelize(s)
      s.to_s.camelize(:lower).gsub(/Id$/, 'ID')
    end

    def parsed_response(response)
      JSON.parse(response.body)
    end

    def headers
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }
    end

    def basic_auth
      { username: Tangolicious.platform_name, password: Tangolicious.platform_key }
    end
  end
end
