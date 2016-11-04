class MusicMailer < ApplicationMailer
    default from: "musicalert1@gmail.com"
    require 'user'
    
    def send_signup_email(user)
        @user = user
        mail( :to => @user.email,
        :subject => 'Thanks for signing up for Music Alert!' )
    end
    
    
    def morning_email(user)
        @user = user
        @selection = @user.media.shuffle.last
        @song = @selection.song
        @artist = @selection.artist 
        @album = @selection.album 
        
        mail(to: @user.email, subject: "Good morning!")
           
    end
    
    def evening_email(user)
        @user = user
        @selection = @user.media.shuffle.last
        @song = @selection.song
        @artist = @selection.artist 
        @album = @selection.album 
        
        mail(to: @user.email, subject: "Good evening!")
           
    end
    
end
