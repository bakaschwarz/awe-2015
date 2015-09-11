class ApiTokensController < ApplicationController
  before_action :set_token

  def update
    if @token.update(token_params)
      flash[:success] = "Successfully set new token."
    else
      flash[:danger] = "Token could not be updated."
    end
    redirect_to static_pages_wetter_config_path
  end

  private
    def set_token
      @token = ApiToken.find(params[:id])
    end

    def token_params
      params.permit(:token)
    end
end
