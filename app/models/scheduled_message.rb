class ScheduledMessage < ActiveRecord::Base
  belongs_to(
    :plan,
    class_name: "Plan",
    foreign_key: :plan_id,
    primary_key: :id
  )
end
