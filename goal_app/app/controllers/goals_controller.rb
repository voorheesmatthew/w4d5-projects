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
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_url(current_user)
  end
  
  def goal_params
    params.require(:goal).permit(:body)
  end
  
end