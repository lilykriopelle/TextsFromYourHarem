class ScheduledMessage < ActiveRecord::Base
  belongs_to(
    :plan,
    class_name: "Plan",
    foreign_key: :plan_id,
    primary_key: :id
  )
  
  #implement the actual sending of this message here;  you can schedule the delayed job in the Plans Controller like so:
  # ScheduledMessage.delay(:run_at => 5.days.from_now).send_via_twilio
  def self.send_via_twilio
    #the actual hard implementation of the Twilio API call will go here
  end
end
