class WebmotorsService
  WEBMOTORS_WEBSITE = 'http://www.webmotors.com.br'
  ENDPOINTS = {
    Manufacturer  => URI("#{WEBMOTORS_WEBSITE}/carro/marcas"),
    Model         => URI("#{WEBMOTORS_WEBSITE}/carro/modelos")
  }

  def self.fetch_models_from_manufacturer(manufacturer)
    Rails.cache.fetch("WebmotorsService#fetch_models_from_manufacturer_##{manufacturer.id}", expires_in: 24.hours) do
      self.fetch Model, manufacturer
    end
  end

  def self.fetch_manufacturers
    Rails.cache.fetch('WebmotorsService#manufacturers', expires_in: 24.hours) do
      self.fetch Manufacturer
    end
  end

  private
  def self.fetch(klass, manufacturer = nil)
    options = {}
    options[:marca] = manufacturer.webmotors_id if manufacturer

    response      = Net::HTTP.post_form(ENDPOINTS[klass], options)
    json_response = JSON.parse response.body

    json_response.each do |json_attr|
      properties = { name: json_attr["Nome"] }

      if klass == Model
        properties[:manufacturer] = manufacturer
      elsif klass == Manufacturer
        properties[:webmotors_id] = json_attr["Id"]
      end

      klass.create properties unless klass.exists?(properties)
    end
  end
end
