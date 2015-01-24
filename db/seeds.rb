# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create(email: "joseph.e.combs+asdfasdf@gmail.com", password: "password1", name: "Joe")
User.create(email: "a@gmail.com", password: "password1", name: "Joe", confirmed_at: Date.parse(Time.now.to_s))

# create_table :plans do |t|
#   t.timestamp :start_time, null: false
#   t.timestamp :end_time, null: false
#   t.integer :booker_id, null: false
#   t.integer :message_pattern_id
#   t.integer :number_of_fake_women, null: false
#   t.boolean :active
#   t.timestamps
# end

Plan.create(start_time: Date.parse(Time.now.to_s), end_time: Date.parse(Time.now.to_s), booker_id: 1, message_pattern_id: 1, number_of_fake_women: 3, active: true)