# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

u1 = User.create(email:'thomas@cool.com', password:'zipchatpassword',
            first_name:'Thomas', surname:'Wilkinson', username: 'thomasw')
u2 = User.create(email:'tdog@awesome.com', password:'zipchatpassword',
            first_name:'Finn', surname:'Human', username: 'finnh')
u3 = User.create(email:'money@booyah.com', password:'zipchatpassword',
            first_name:'Jake', surname:'Dog', username: 'jakethedog')
u4 = User.create(email:'satan@adventuretime.com', password:'zipchatpassword',
            first_name:'Princess', surname:'Bubblegum', username: 'pbubbles')

puts 'Added 4 new users'

Conversation.delete_all

c1 = Conversation.create(sender_id: u1.id, recipient_id: u2.id)
c2 = Conversation.create(sender_id: u2.id, recipient_id: u3.id)

puts 'Added 2 new conversations'

c1.messages.build(user_id: u1.id, body: 'Wanna go on an adventure?').save!
c1.messages.build(user_id: u2.id, body: "Sounds good, I'll ask Jake too").save!

c2.messages.build(user_id: u2.id, body: 'You are my dog!').save!
c2.messages.build(user_id: u3.id, body: 'Noooo - I am your best friend! :)').save!

puts 'Added seed messages to conversations'