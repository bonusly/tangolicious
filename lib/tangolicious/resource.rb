require 'tangolicious/request'
require 'active_support'
require 'active_support/inflector'

module Tangolicious
  class Resource < OpenStruct
    def self.wrap(resources)
      resources.map { |resource| new(resource) }
    end

    def self.list
      wrap(request.get(endpoint))
    end

    def self.retrieve(id)
      new(request.get("#{endpoint}/#{id}"))
    end

    def initialize(attributes = {})
      super(underscorize_keys(attributes))
    end

    def request
      @request ||= Request.new
    end

    private

    def rubyize(s)
      s.to_s.underscore.downcase.to_sym
    end

    def underscorize_keys(attributes)
      attributes.each_with_object({}) { |item, hash| hash[rubyize(item.first)] = item.last }
    end

    def attributes_for_request
      to_h.each_with_object({}) { |item, hash| hash[tangocard_camelize(item.first)] = item.last }
    end
  end
end

