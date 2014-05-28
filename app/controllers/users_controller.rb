class UserController < ApplicationController
  before_filter :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to_edit_user_registration_path(current_user)
    else
      render "devise/registration/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end