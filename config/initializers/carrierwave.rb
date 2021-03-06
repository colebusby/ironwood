CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['S3_KEY'],                        # required
      :aws_secret_access_key  => ENV['S3_SECRET'],                        # required
      :s3_endpoint            => 's3.amazonaws.com'
    }
    config.fog_directory  = ENV['PICTURES_BUCKET']                     # required
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end