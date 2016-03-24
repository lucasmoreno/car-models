# encoding: UTF-8

manufacturers = %w(Chevrolet Citroën Fiat Ford Honda Hyundai Kia Mitsubishi Nissan Peugeot Renault Toyota Volkswagen)

manufacturers.each do |name|
  Manufacturer.find_or_create_by name: name
end

puts "#{manufacturers.size} car manufacturers created"
