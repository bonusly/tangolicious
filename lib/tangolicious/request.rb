require 'httparty'
require 'active_support/inflector'

module Tangolicious
  class Request
    def get(endpoint)
      parsed_response(HTTParty.get("#{Tangolicious.api_base}#{endpoint}",
                                   basic_auth: basic_auth))
    end

    def post(endpoint, params)
      parsed_response(HTTParty.post("#{Tangolicious.api_base}#{endpoint}",
                                    basic_auth: basic_auth,
                                    body: tangocard_camelize(params).to_json,
                                    headers: headers))
    end

    private

    def tangocard_camelize(s)
      s.to_s.camelize(:lower).gsub(/Id$/, 'ID').to_sym
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
