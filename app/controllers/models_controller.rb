class ModelsController < ApplicationController
  def index
    #search the models
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    # Make request for Webmotors site
    @manufacturer = Manufacturer.find_by_id params[:manufacturer_id]

    response = Net::HTTP.post_form(uri, { marca: params[:webmotors_manufacturer_id] })
    models_json = JSON.parse response.body

    # Itera no resultado e grava os modelos que ainda não estão persistidas
    models_json.each do |json|
      if Model.where(name: json["Nome"], manufacturer_id: @manufacturer.id).size == 0
        Model.create(manufacturer_id: @manufacturer.id, name: json["Nome"])
      end
    end
  end
end
