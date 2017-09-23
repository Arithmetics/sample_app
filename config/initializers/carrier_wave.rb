if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage    =  :aws                  # required
    config.aws_bucket =  ENV['S3_BUCKET']      # required
    config.aws_acl    =  :public_read


    config.aws_credentials = {
      access_key_id:      ENV['S3_KEY'],       # required
      secret_access_key:  ENV['S3_SECRET']
      region: ENV['S3_REGION']
    }
  end
end
