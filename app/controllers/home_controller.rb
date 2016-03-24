class HomeController < ApplicationController
  def index
    #search the manufacturer
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |manufacturer_params|
      if Manufacturer.where(name: manufacturer_params["Nome"]).size == 0
        Manufacturer.create(name: manufacturer_params["Nome"], webmotors_id: manufacturer_params["Id"])
      end
    end
  end
end
