Rails.application.config.secret_key_base ||= Rails.application.secrets.secret_key_base

if Rails.application.config.secret_key_base.to_s.length < 30
  fail 'env var SECRET_KEY_BASE or config/secrets.yml:secret_key_base must be 30 characters or more'
end
