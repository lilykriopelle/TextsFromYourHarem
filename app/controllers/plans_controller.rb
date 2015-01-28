class PlansController < ApplicationController
  def index
    @plans = Plan.all.where(booker_id: current_user.id)
  end
  
  def show
    @plan = Plan.find(params[:id])
    @scheduled_messages = ScheduledMessage.where(plan_id: params[:id])
    render :show
  end
  
  def create
    @plan = Plan.create(
      booker_id: current_user.id,
      start_time: Time.parse(plan_params[:start_time]),
      end_time: Time.parse(plan_params[:end_time]),
      message_pattern_id: plan_params[:message_pattern_id].to_i,
      number_of_fake_women: plan_params[:number_of_fake_women].to_i,
      active: true
    )
    
    # @plan = Plan.create(plan_params)
    
    if @plan.save!
      #create the associated Scheduled messages
      #right now only create one message per woman
      originating_phone_numbers = ["585-563-5535", "585-563-5535"]

      #TODO change this when you deploy the application because this is on github right now      
      account_sid = 'ACd03267451473bacc7a5551eb20befaf0'
      auth_token = ENV['TWILIO_SECRET']
    
      # set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new account_sid, auth_token
      
      plan_params[:number_of_fake_women].to_i.times do |i|
        @scheduled_message = ScheduledMessage.create(
          plan_id: @plan.id,
          send_at: (Time.at((plan_params[:end_time].to_f - plan_params[:start_time].to_f)*rand + plan_params[:start_time].to_f)), 
          body: Faker::Company.bs,
          from_phone_number: originating_phone_numbers[i], 
          active: true
        )
        if @scheduled_message.save!
          @scheduled_message.delay(:run_at => 10.seconds.from_now).send_via_twilio(@client)
          # @scheduled_message.delay(:run_at => 10.seconds.from_now).test_method
        end
      end
      
      redirect_to plan_url(@plan)
    else
      
    end

  end
  
  def update
    
  end
  
  def destroy
    @plan = Plan.find_by(id: params[:id])
    puts @plan.id
    
    if @plan.booker_id == current_user.id 
      @plan.delete
      redirect_to plans_url
    else
      #they are trying to delete a plan they do not own.  scold them for being a hacker.
    end
  end
  
  def new
    
  end
  
  private
  def plan_params
    params.require(:plan).permit(:booker_id, :start_time, :end_time, :message_pattern_id, :number_of_fake_women, :id)
  end
end
