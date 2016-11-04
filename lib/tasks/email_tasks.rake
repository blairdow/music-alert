desc 'send morning email'
task send_morning_email: :environment do
    @users = User.all
        @users.each do |user|
            
            time_now = Time.now
            puts user.morning_commute
            puts Time.now
            puts Time.now.hour == user.morning_commute.hour
            puts Time.now.min == user.morning_commute.min
            if (Time.now.hour == user.morning_commute.hour && Time.now.min == user.morning_commute.min) 
                puts "sent"
                MusicMailer.morning_email(user).deliver_now!
            end
        end
    
end

desc 'send evening email'
task send_evening_email: :environment do
    @users = User.all
        @users.each do |user|
            
            time_now = Time.now
            
            if (Time.now.hour == user.evening_commute.hour && Time.now.min == user.evening_commute.min) 
                puts "sent"
                MusicMailer.evening_email(user).deliver_now!
            end
        end
    
end