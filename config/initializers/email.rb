if ENV['EMAIL_INTERCEPTOR_RECIPIENT'].present?
  require 'recipient_interceptor'
  Mail.register_interceptor RecipientInterceptor.new(
    ENV['EMAIL_INTERCEPTOR_RECIPIENT'],
    subject_prefix: "[#{Rails.env}]"
  )
end
