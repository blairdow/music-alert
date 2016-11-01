# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Medium.delete_all

blair = User.create({first_name: 'Blair', last_name: "Dowis", email: "blairdow@gmail.com", password: "abc123"})
nevil = User.create({first_name: 'Nevil', last_name: "Jackson", email: "nevil.jackson@gmail.com", password: "abc123"})
    
    #users
    100.times do 
        User.create(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            password: 'abc123', 
            morning_commute: Faker::Time.forward(2, :morning), 
            evening_commute: Faker::Time.forward(2, :evening)
            )
    end
    
    #songs
    200.times do
        Medium.create(
            song: Faker::Hipster.word, 
            album: Faker::Hipster.word,
            artist: Faker::Hipster.word,
            user_id: Faker::Number.between(1, 102)
            )
    end

    #artists
    200.times do
        Medium.create(
            artist: Faker::Hipster.word,
            user_id: Faker::Number.between(1, 102)
            )
    end

    #albums
    200.times do
        Medium.create(
            artist: Faker::Hipster.word,
            album: Faker::Hipster.word,
            user_id: Faker::Number.between(1, 102)
            )
    end

song1 = Medium.create ({song: 'FourFiveSeconds', artist: 'Kanye West', album: 'FourFiveSeconds'})
song2 = Medium.create ({song: 'Hello Goodbye', artist: 'The Beatles', album: 'Hello Goodbye'})


blair.media << song1
nevil.media << song2

#followers/following
    500.times do
        Relationship.create (
            follower_id: Faker::Number.between(1, 102),
            followed_id: Faker::Number.between(1, 102)
        )
    end


