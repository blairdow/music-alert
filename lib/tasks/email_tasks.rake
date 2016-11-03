desc 'send morning email'
task send_morning_email: :environment do
    MusicMailer.morning_email(@user).deliver!
end