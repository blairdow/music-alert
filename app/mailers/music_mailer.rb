class MusicMailer < ApplicationMailer
    default from: "musicalert1@gmail.com"
    
    def morning_email(user)
        @user = user
        
        @selection = @user.media.shuffle.last
        @song = @selection.song
        @artist = @selection.artist 
        @album = @selection.album 
        
        mail(to: @user.email, subject: "Good morning!")
    end
end
