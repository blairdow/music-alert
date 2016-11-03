class SendEmailJob < ActiveJob::Base
#  queue_as :default
    class << self
            
        def send_morning_email
            @users = User.all
            @users.each do |user|
                puts "sent"
                @morning_commute = user.morning_commute.strftime( "%H%M" ) 
                MusicMailer.morning_email(user).deliver!
            end
        end
        handle_asynchronously :send_morning_email, :run_at => Proc.new { @morning_commute }
    end
end