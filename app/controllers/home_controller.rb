class HomeController < ApplicationController
  def index
    @manufacturers = Manufacturer.all

    WebmotorsService::fetch_manufacturers
  end
end
