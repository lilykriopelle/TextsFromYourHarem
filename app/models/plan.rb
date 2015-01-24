# create_table "plans", force: true do |t|
#   t.datetime "start_time",         null: false
#   t.datetime "end_time",           null: false
#   t.integer  "booker_id"
#   t.integer  "message_pattern_id"
#   t.boolean  "active"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

class Plan < ActiveRecord::Base
  validates :start_time, :end_time, :message_pattern_id, :active, :booker_id, :number_of_fake_women, presence: true
  
  belongs_to(
    :booker,
    class_name: "User",
    foreign_key: :booker_id,
    primary_key: :id
  )
  
  # has_many(
  #   :scheduled_messages,
  #   class_name: "ScheduledMessage",
  #   foreign_key: :plan_id,
  #   primary_key: :id
  # ), dependent: :destroy
  
  has_many :scheduled_messages, dependent: :destroy
end