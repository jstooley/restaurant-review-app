Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY = 9802ce5ba57ea3da8a7c'], ENV['GITHUB_SECRET = 921f940eb3c0d0af5b0419f75ebe025b69901cbf']
end