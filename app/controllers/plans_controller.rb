class PlansController < ApplicationController
  def index
    
  end
  
  def show
    @plan = Plan.find(params[:id])
    @scheduled_messages = ScheduledMessage.where(plan_id: params[:id])
    render :show
  end
  
  def create
    render :create
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  def plan_params
    params.require(:plan).permit(:booker_id, :start_time, :end_time, :message_pattern_id, :number_of_fake_women)
  end
end
