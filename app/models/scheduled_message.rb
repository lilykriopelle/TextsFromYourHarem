class ScheduledMessage < ActiveRecord::Base
  belongs_to(
    :plan,
    class_name: "Plan",
    foreign_key: :plan_id,
    primary_key: :id
  )
  
  #implement the actual sending of this message here;  you can schedule the delayed job in the Plans Controller like so:
  # ScheduledMessage.delay(:run_at => 5.days.from_now).send_via_twilio
  def send_via_twilio(client)
    #TODO: figure out how to require gems in delayed_job
    # require 'twilio-ruby'
    #the actual hard implementation of the Twilio API call will go here
    
    # put your own credentials here 
    #------------------------------
    # account_sid = 'ACd03267451473bacc7a5551eb20befaf0'
    # #TODO change this when you deploy the application because this is on github right now
    # auth_token = '1b15aa4259291f52c024b8c6381ab96c' || ENV['TWILIO_SECRET']
    #
    # # set up a client to talk to the Twilio REST API
    # @client = Twilio::REST::Client.new account_sid, auth_token
    
    client.account.messages.create({
      from: self.from_phone_number,
      #TODO: turn this on after you add and validate phone_number in devise users table
      #to: self.plan.booker.phone_number,
      to: '15853191067',
      body: self.body,
    })
    #------------------------------
  end
end
