class Manufacturer < ActiveRecord::Base
  has_many :models

  validates_presence_of :name, :webmotors_id
  validates_uniqueness_of :name, :webmotors_id

  default_scope { order :name }
end
