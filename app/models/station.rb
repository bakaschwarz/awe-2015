class Station < ActiveRecord::Base
  has_many :sensors
  validates :node_number, numericality: true
end
