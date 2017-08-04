require 'tangolicious/request'
require 'tangolicious/util'
require 'active_support'
require 'active_support/inflector'

module Tangolicious
  class Resource < OpenStruct
    include Util

    def self.wrap(resources)
      resources.map { |resource| new(resource) }
    end

    def self.list(params = {})
      wrap(request.get(endpoint, params))
    end

    def self.retrieve(id)
      new(request.get("#{endpoint}/#{id}"))
    end

    def self.request
      @request ||= Request.new
    end

    def initialize(attributes = {})
      super(underscorize_keys(attributes))
    end

    private

    def underscorize_keys(attributes)
      call_recursively(attributes, :rubyize)
    end

    def rubyize(s)
      s.to_s.underscore.downcase.to_sym
    end
  end
end

