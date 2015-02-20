unless $i18n_configured ||= false
  $i18n_configured = true

  # [deprecated] I18n.enforce_available_locales will default to true in the future. If you really want to skip validation of your locale you can set I18n.enforce_available_locales = false to avoid this message.
  #I18n.enforce_available_locales = false
  I18n.enforce_available_locales = true
  # https://stackoverflow.com/questions/13369996/locale-fallback-from-country-to-language-without-having-to-define-each-individua
  if Rails.env.production? && defined? I18n::Backend::Redis
    I18n.backend = I18n::Backend::Chain.new(I18n::Backend::Redis.new, I18n.backend)
  end
  I18n.backend.class.send(:include, I18n::Backend::Fallbacks)
  require 'i18n/backend/cache'
  I18n.backend.class.send(:include, I18n::Backend::Cache)
end
