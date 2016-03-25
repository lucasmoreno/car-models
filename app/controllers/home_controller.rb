class HomeController < ApplicationController
  def index
    WebmotorsService::fetch_manufacturers
    @manufacturers = Manufacturer.all
  end
end
