# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Medium.delete_all

user1 = User.create({first_name: 'Blair', last_name: "Dowis", email: "blairdow@gmail.com", password: "abc123"})
user2 = User.create({first_name: 'Nevil', last_name: "Jackson", email: "nevil.jackson@gmail.com", password: "abc123"})


song1 = Medium.create ({song: 'FourFiveSeconds', artist: 'Kanye West', album: 'FourFiveSeconds'})
song2 = Medium.create ({song: 'Hello Goodbye', artist: 'The Beatles', album: 'Hello Goodbye'})


user1.media << song1
user2.media << song2

## Space Agency ↔ Nation
#
#usa.space_agencies << nasa
#ussr.space_agencies << ussr_sa
#ussr.space_agencies << interkosmos
#
## Mission ↔ Space Traveler
#
#mr3.space_travelers << shepard
#mr4.space_travelers << grissom
#ma6.space_travelers << glenn
#ma7.space_travelers << carpenter
