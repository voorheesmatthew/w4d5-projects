class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    render :new
  end
  
  def create
    @comment = Comment.new(comm_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to user_url(current_user)
    end
  end
  
  def destroy
  end
  
  def comm_params
    params.require(:comm).permit(:body, :goal_id)
  end
end
