require 'httparty'

module Tangolicious
  class Request
    def get(endpoint)
      HTTParty.get("#{Tangolicious.api_base}#{endpoint}", basic_auth: basic_auth)
    end

    def post(endpoint, params)
      HTTParty.post("#{Tangolicious.api_base}#{endpoint}", basic_auth: basic_auth, body: params.to_json)
    end

    private

    def basic_auth
      { username: Tangolicious.platform_name, password: Tangolicious.platform_key }
    end
  end
end
