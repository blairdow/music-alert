#Music Alert

If you're anything like me, you often encounter music during the day and you tell yourself, "Ooh, self! Remember to listen to that later." Then you promptly forget. 

Well not with **Music Alert**! 

Once you sign up, you can add music (songs, artists, or albums) to your list as you go about your day. The app lets you input your commute times (morning and evening) and then it will email you a random selection from your list twice a day at your selected times! 


### Visit the site: [Music Alert](http://ec2-54-183-5-242.us-west-1.compute.amazonaws.com:3000/)

###On **Music Alert** you can:    

* create a profile 
* get an email notification that your profile was created 
* upload a profile picture  
* follow and unfollow other users  
* view their  music selections (aka playlists)  
* edit your own selections  
* add music to your list right from your profile page 
* get twice daily emails with selections from your music list 
* edit your profile (including commute times)  
* edit password on a page separate from the rest of user's profile info (to prevent having to re-enter it everytime other info is edited)
* change your (super secure) password that is salted and hashed with Password Digest  
* view your followers and followings  
* view other users followers and followings  
* search users to find your friend's profiles 


##About

**Music Alert** is a full stack CRUD Rails app(version 4.2.7 & Ruby version 2.2.3)(complete with RESTful routes!), styled with CSS and using HTML in the view. Bootstrap and Google Fonts were also used. 

The email function uses Cron to send emails twenty four hours a day at the user-specified time. It does this by running a rake task every minute, and if the user's time is the same as the current time, an email will be sent to them. The email is set up in the rails Action Mailer function and created with HTML in the mailer view. 

Amazon Web Services was employed to store user uploaded profile images, using Imagemagick and the Paperclip gem. Instructions to install Paperclip and Imagemagick can be found [here](https://www.youtube.com/watch?v=Z5W-Y3aROVE).  

##Deployment 

The site is deployed with Ubuntu on [Amazon Web Services EC2](https://aws.amazon.com/ec2/). This was chosen instead of Heroku in order to use Cron, which Heroku does not currently support.


##Rails Gems Used
* [**Faker**](https://github.com/stympy/faker): for seed data  
* [**Paperclip**](https://github.com/thoughtbot/paperclip): used with Imagemagick for image upload on Amazon Web Services  
* [**Bcrypt**](https://rubygems.org/gems/bcrypt/versions/3.1.11): for password security  
* [**Bootstrap**](https://rubygems.org/gems/bootstrap): for Bootstrap CSS framework
* [**Figaro**](https://github.com/laserlemon/figaro): to securely store configuration values  

##Development
* Rails Action Mailer was used to create formatted email for each user
* A rake task and Cron were used to automate email sending at user-specific time
* Rails Sessions were used to keep user logged in and separate functionality for logged in vs. logged out, as well as separate functionality on a user's own profile page
* Helpers were used to create forms, as well as to create Follow/Unfollow buttons
* Three models were used, one for User's info, one for User's Media (songs, artists, albums) and one for User relationships (followers/following). I used [this tutorial](https://github.com/ezRAez/crud_related_models) to create the Relationships model.
* I attempted to use Redis and the Resque gem to schedule email sending, but in the end Cron was the right option. It was still cool to learn how to use Redis though!
* sensitive information (gmail login to send emails and Amazon web services key) was kept secure using the Figaro gem and .gitignore
* Search function was added with [this tutorial](http://www.rymcmahon.com/articles/2) created by [Ryan McMahon](https://github.com/rymcmahon). 
* Default user profile image is a shark/seagull. Upload your own to get rid of this creepy thing!

##Planning
* [Trello](https://trello.com/b/dSzsG32O/musicreminders)
* hand-sketched wire frames

##Next Steps
* 'Add' button on other user's pages, to add their music selection to your list
* Show 'Follow' button next to user's names on search page
* Turn images on search pages and followers/following list pages into clickable links
* enable Time Zone selection on user sign up page
* Make edit form specific to media type (artist, song, or album)
* Include link to actual song, artist, or album on streaming service of user's choice in daily emails using streaming service APIs
* add notification emails when profile is updated or password is changed

### Link: [Music Alert](http://ec2-54-183-5-242.us-west-1.compute.amazonaws.com:3000/)





