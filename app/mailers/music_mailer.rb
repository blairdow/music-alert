class MusicMailer < ApplicationMailer
    default from: "musicalert1@gmail.com"
    
    def send_signup_email(user)
        @user = user
        mail( :to => @user.email,
        :subject => 'Thanks for signing up for our amazing app' )
    end
    
    def morning_email(user)
        @user = user
        
        @selection = @user.media.shuffle.last
        @song = @selection.song
        @artist = @selection.artist 
        @album = @selection.album 
        
        mail(to: @user.email, subject: "Good morning!", body: "test")
    end
end
