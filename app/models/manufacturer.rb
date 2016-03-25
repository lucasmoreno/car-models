class Manufacturer < ActiveRecord::Base
  has_many :models
  validates_presence_of :name, :webmotors_id
end
