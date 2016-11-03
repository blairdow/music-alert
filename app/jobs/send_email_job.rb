class SendEmailJob < ActiveJob::Base
#  queue_as :default
    
#    Users = User.all
    def self.send_morning_email
        puts "sending morning email"
        while true
            sleep 1
            MusicMailer.send_signup_email.deliver!
        end
#        Users.each do |user|
#        MusicMailer.morning_email(user).deliver!
#        end
#        Time = user.morning_commute.strftime ("%H%M")
    end
#    handle_asynchronously :in_the_future, :run_at => Time
    
end
