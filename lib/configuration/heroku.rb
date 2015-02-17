module Configuration
  module Heroku
    HEROKU_ENV_REGEX = /HEROKU/

    def present?
      ENV.any? { |k,_| k =~ HEROKU_ENV_REGEX }
    end
  end
end
