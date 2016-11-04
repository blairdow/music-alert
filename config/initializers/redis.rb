$redis = Redis.new(:host => 'localhost', :port => 6379)

#SendEmailJob.send_morning_email