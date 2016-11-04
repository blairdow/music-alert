#Music Alert

If you're anything like me, you often encounter music during the day and you tell yourself, "Ooh, self! Remember to listen to that later." Then you promptly forget. 

Well not with **Music Alert**! 

Once you sign up, you can add music (songs, artists, or albums) to your list as you go about your day. The app lets you input your commute times (morning and evening) and then it will email you a random selection from your list twice a day at your selected times! 

On **Music Alert** you can:  

* upload a profile picture  
* follow and unfollow other users  
* view their  music selections (aka playlists)  
* edit your own selections  
* add music to your list right from your profile page  
* edit your profile (including commute times)  
* edit password on a page separate from the rest of user's profile info (to prevent having to re-enter it everytime other info is edited)
* change your (super secure) password that is salted and hashed with Password Digest  
* view your followers and followings  
* view other users followers and followings  
* search users to find your friend's profiles  

##About

**Music Alert** is a full stack CRUD Rails app (complete with RESTful routes!), styled with CSS and using HTML in the view. Bootstrap and Google Fonts were also used. 

The email function uses a rake task combined with a cronjob running in the background to send emails twenty four hours a day at the user-specified time. The email is set up in the rails Action Mailer function and created with HTML in the mailer view. 

Amazon Web Services was employed to store user uploaded profile images. 

##Deployment 

The site is deployed with Ubuntu on Amazon Web Services. This was chosen instead of Heroku in order to use a cronjob which Heroku does not currently support.


##Rails Gems Used
* **Faker**: for seed data  
* **Paperclip**: used with Imagemagick for image upload on Amazon Web Services  
* **Bcrypt**: for password security  
* **Bootstrap**: for Bootstrap CSS framework  

##Rails/Ruby Functions Used
* Rails Action Mailer was used to create formatted email for each user
* A rake task and cronjob were used to automate email sending at user-specific time
* Rails Sessions were used to keep user logged in and separate functionality for logged in vs. logged out, as well as separate functionality on a user's own profile page
* Helpers were used to create forms, as well as to create Follow/Unfollow buttons
* Three models were used, one for User's info, one for User's Media (songs, artists, albums) and one for User relationships (followers/following)
* I attempted to use Redis and the Resque gem to schedule email sending, but in the end cronjob was the right option. It was still cool to learn how to use Redis though!
* sensitive information (gmail login to send emails and Amazon web services key) was kept secure using .gitignore

##Next Steps
* 'Add' button on other user's pages, to add their music selection to your list
* Show 'Follow' button next to user's names on search page
* enable Time Zone selection on user sign up page
* Make edit form specific to media type (artist, song, or album)
* Include link to actual song, artist, or album on streaming service of user's choice in daily emails using streaming service APIs





