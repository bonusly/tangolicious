require 'spec_helper'

module Tangolicious
  describe Request do
    let(:request) { Request.new }
    let(:platform_name) { 'platform_name' }
    let(:platform_key) { 'platform_key' }
    let(:endpoint) { 'endpoint' }
    let(:basic_auth) { { basic_auth: { username: platform_name, password: platform_key } } }
    let(:post_params) { basic_auth.merge(body: { accountIdentifier: 'testaccount' }.to_json, headers: request.send(:headers)) }
    let(:bad_request_response) { {
      "timestamp" => "2017-05-31T19:34:38.176Z",
      "requestId" => "7f7b04b0-b933-442c-9f33-eaa18a033ebd",
      "path" => "/v2/orders", "httpCode" => 400,
      "httpPhrase" => "Bad Request",
      "errors" => [{ "path" => "accountIdentifier", "message" => "may not be null", "invalidValue" => nil, "constraint" => "NotNull" }]
    } }
    let(:unauthorized_response) { {
      "timestamp" => "2017-05-30T17:30:07.169Z",
      "requestId" => "5ec74ff1-dbdf-4c95-8e2b-1c5859cd5260",
      "path" => "/v2/accounts",
      "httpCode" => 401,
      "httpPhrase" => "Unauthorized",
      "message" => "Authentication failed. Please check your platform name and key. If you continue to have problems please contact devsupport@tangocard.com"
    } }

    before do
      Tangolicious.platform_name = platform_name
      Tangolicious.platform_key = platform_key
    end

    describe '#get' do
      it 'should make a get request to Tangocard' do
        expect(HTTParty).to receive(:get).with("#{Tangolicious.api_base}#{endpoint}", basic_auth) { double(body: '[]') }
        expect(request.get(endpoint)).to eq []
      end

      it 'should raise an exception if a request is unauthorized' do
        expect(HTTParty).to receive(:get).with("#{Tangolicious.api_base}#{endpoint}", basic_auth) { double(body: unauthorized_response.to_json) }
        expect { request.get(endpoint) }.to raise_error(Exceptions::Unauthorized)
      end
    end

    describe '#post' do
      it 'should make a post request to Tangocard and properly convert underscore parameters to camel case' do
        expect(HTTParty).to receive(:post).with("#{Tangolicious.api_base}#{endpoint}", post_params) { double(body: '[]') }
        expect(request.post(endpoint, account_identifier: 'testaccount')).to eq []
      end

      it 'should raise an exception if a request is bad' do
        expect(HTTParty).to receive(:post).with("#{Tangolicious.api_base}#{endpoint}", post_params) { double(body: bad_request_response.to_json) }
        expect { Request.new.post(endpoint, account_identifier: 'testaccount') }.to raise_error(Exceptions::BadRequest)
      end
    end
  end
end
