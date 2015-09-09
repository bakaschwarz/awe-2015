class UsersController < ApplicationController
  before_action :set_user

  def update
    @user.update(user_params)
    redirect_to static_pages_wetter_config_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:id, :password, :password_confirmation, :email, :filter_range, :filter_precision)
    end
end
