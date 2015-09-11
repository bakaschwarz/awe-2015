class ConfigsController < ApplicationController
  before_action :set_conf

  def update
    if @conf.update(conf_params)
      redirect_to static_pages_wetter_config_path
    else
      flash[:danger] = "Illegal Input"
      redirect_to  static_pages_wetter_config_path
    end
  end

  private

    def conf_params
      params.permit(:id, :filter_range, :filter_precision)
    end

    def set_conf
      @conf = Config.find(params[:id])
    end
end