unless ENV['PTV_DEV_ID']
  fail "PTV_DEV_ID and PTV_SECRET_KEY must be set in .env"
end

RubyPtv.configure(
  dev_id: ENV.fetch('PTV_DEV_ID'),
  secret_key: ENV.fetch('PTV_SECRET_KEY')
)
