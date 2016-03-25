class ModelsController < ApplicationController
  def index
    if manufacturer = Manufacturer.find_by_id(params[:manufacturer_id])
      WebmotorsService.fetch_models_from_manufacturer manufacturer
      @manufacturer = Manufacturer.find_by_id params[:manufacturer_id]
    else
      redirect_to root_path
    end
  end
end
