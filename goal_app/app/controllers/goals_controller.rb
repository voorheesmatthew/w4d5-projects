class GoalsController < ApplicationController
  
  def new
  end
  
  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    
    @goal.save
    flash[:errors] = @goal.errors.full_messages
    redirect_to user_url(current_user)
  end
  
  def destroy
    @goal = Goal.find
  end
  
end