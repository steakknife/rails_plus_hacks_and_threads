module Configuration
  def self.log_level
    if (l = ENV['RAILS_LOG_LEVEL']).present?
      l.to_sym 
    else
      Rails.env.production? ? :info : :debug
    end
  end
end
