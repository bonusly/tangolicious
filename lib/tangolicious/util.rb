module Tangolicious
  module Util
    def call_recursively(hash, method)
      hash.each_with_object({}) do |item, h|
        key, value = item
        h[send(method, key)] = if value.is_a?(Hash)
                                 call_recursively(value, method)
                               elsif value.is_a?(Array)
                                 value.map { |el| el.is_a?(Hash) ? call_recursively(el, method) : el }
                               else
                                 value
                               end
      end
    end
  end
end
