class PlansController < ApplicationController
  def index
    
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
      #<ScheduledMessage id: 1, plan_id: 1, send_at: "2015-01-24 06:45:46", body: "Hi Joe!", from_phone_number: "585-563-5535", active: true, created_at: "2015-01-24 06:44:46", updated_at: "2015-01-24 06:44:46">
      plan_params[:number_of_fake_women].to_i.times do |i|
        @scheduled_message = ScheduledMessage.create(
          plan_id: @plan.id,
          send_at: (Time.at((plan_params[:end_time].to_f - plan_params[:start_time].to_f)*rand + plan_params[:start_time].to_f)), 
          body: Faker::Company.bs, 
          from_phone_number: originating_phone_numbers[i], 
          active: true
        )
        @scheduled_message.save!
      end
      
      redirect_to plan_url(@plan)
    else
      
    end

  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def new
    
  end
  
  private
  def plan_params
    params.require(:plan).permit(:booker_id, :start_time, :end_time, :message_pattern_id, :number_of_fake_women)
  end
end
