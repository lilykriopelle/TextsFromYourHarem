# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create(email: "joseph.e.combs+asdfasdf@gmail.com", password: "password1", name: "Joe")
User.create(email: "a@gmail.com", password: "password1", name: "Joe", confirmed_at: Time.now)
# User.delay(run_at: 30.seconds.from_now).create(email: "b@gmail.com", password: "password1", name: "Sally", confirmed_at: Time.now)
# User.delay(run_at: 30.seconds.from_now).new(email: "b@gmail.com", password: "password1", name: "Sally", confirmed_at: Time.now)
# User.delay(run_at: (Time.now + 30)).create(email: "d@gmail.com", password: "password1", name: "Sally", confirmed_at: Time.now)
# Time.parse("2015-01-23 19:38:24")

User.delay(run_at: (Time.now + 16)).create(email: "d@gmail.com", password: "password1", name: "Sally", confirmed_at: Time.now)

# create_table :plans do |t|
#   t.timestamp :start_time, null: false
#   t.timestamp :end_time, null: false
#   t.integer :booker_id, null: false
#   t.integer :message_pattern_id
#   t.integer :number_of_fake_women, null: false
#   t.boolean :active
#   t.timestamps
# end

Plan.create(start_time: (Time.now), end_time: (Time.now + 360), booker_id: 1, message_pattern_id: 1, number_of_fake_women: 3, active: true)
Plan.create(start_time: (Time.now + 35), end_time: (Time.now + 400), booker_id: 1, message_pattern_id: 3, number_of_fake_women: 2, active: true)

# create_table "scheduled_messages", force: true do |t|
#   t.integer  "plan_id",           null: false
#   t.datetime "send_at",           null: false
#   t.text     "body",              null: false
#   t.text     "from_phone_number", null: false
#   t.boolean  "active",            null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end


ScheduledMessage.create(plan_id: 1, send_at: (Time.now + 60), body: "Hi Joe!", from_phone_number: "585-563-5535", active: true)
ScheduledMessage.create(plan_id: 1, send_at: (Time.now + 70), body: "Hi you're the best!", from_phone_number: "585-563-5535", active: true)
ScheduledMessage.create(plan_id: 1, send_at: (Time.now + 80), body: "You are a god", from_phone_number: "585-563-5535", active: true)
ScheduledMessage.create(plan_id: 1, send_at: (Time.now + 90), body: "A beautiful genius", from_phone_number: "585-563-5535", active: true)









