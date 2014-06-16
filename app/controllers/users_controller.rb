class UsersController < ApplicationController
  before_filter :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to root_path
    else
      render "devise/registrations/edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :avatar, :avatar_cache, :email_favorites)
  end
end