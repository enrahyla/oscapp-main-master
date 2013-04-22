OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '556272987750719','82e65afbb68e70b38807493dd4cbb417'
end