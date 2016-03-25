class Model < ActiveRecord::Base
  belongs_to :manufacturer

  validates_presence_of :name, :manufacturer

  default_scope { order :name }
end
