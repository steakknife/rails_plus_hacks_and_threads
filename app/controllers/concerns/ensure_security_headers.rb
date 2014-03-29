module Concerns
  module EnsureSecurityHeaders
    extend ActiveSupport::Concern
    included do
      ensure_security_headers
    end
  end
end
