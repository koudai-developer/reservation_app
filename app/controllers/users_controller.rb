class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      redirect_to users_index_path, notice: "プロフィールを更新しました"
    else
      render :edit_profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
