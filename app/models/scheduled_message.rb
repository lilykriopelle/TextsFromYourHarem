class ScheduledMessage < ActiveRecord::Base
  belongs_to(
    :plan,
    class_name: "Plan",
    foreign_key: :plan_id,
    primary_key: :id
  )
  
  #implement the actual sending of this message here;  you can schedule the delayed job in the Plans Controller like so:
  # ScheduledMessage.delay(:run_at => 5.days.from_now).send_via_twilio
  def send_via_twilio
    #the actual hard implementation of the Twilio API call will go here
    
    # put your own credentials here 
    #------------------------------
    account_sid = 'ACd03267451473bacc7a5551eb20befaf0'
    #TODO change this when you deploy the application because this is on github right now
    auth_token = '1b15aa4259291f52c024b8c6381ab96c'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+15855635535',
      :to => '15853191067',
      :body => "You're the best man",
      # :body => self.body,
    })
    #------------------------------

  end
end
