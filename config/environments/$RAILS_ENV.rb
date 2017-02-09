Rails.application.configure do
config.action_mailer.delivery_method = :smtp
    # SMTP settings for gmail
    config.action_mailer.smtp_settings = {
         :address              => "smtp.gmail.com",
         :port                 => 587,
         :user_name            => ENV['GMAIL_USERNAME'],
         :password             => ENV['GMAIL_PASSWORD'],
         :authentication       => "plain",
        :enable_starttls_auto => true
        }
    
config.cache_store = :redis_store, "redis://localhost:6379/1/ns"

config.paperclip_defaults = {
    storage: :s3,
    s3_protocol: :https,
    :s3_host_name => 's3-us-west-1.amazonaws.com',
    s3_credentials: {
      bucket: ENV.fetch('S3_BUCKET_NAME'),
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      s3_region: ENV.fetch('AWS_REGION'),
    }
  }
    
end    