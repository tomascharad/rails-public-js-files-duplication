require 'resque/server'
Resque.redis = ENV["REDISCLOUD_URL"]
# Resque.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))