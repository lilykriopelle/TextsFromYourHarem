class PlansController < ApplicationController
  def index
    
  end
  
  def show
    @plan = Plan.find(params[:id])
    @scheduled_messages = ScheduledMessage.find_by_plan_id(params[:id])
    render :show
  end
  
  def create
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
