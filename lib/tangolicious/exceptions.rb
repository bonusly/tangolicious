module Tangolicious
  module Exceptions
    class BadRequest < StandardError; end
    class Unauthorized < StandardError; end
    class InsufficientFunds < StandardError; end
    class Forbidden < StandardError; end
    class ServiceUnavailable < StandardError; end
  end
end
