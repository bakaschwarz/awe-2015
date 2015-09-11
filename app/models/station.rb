class Station < ActiveRecord::Base
  has_many :sensors
  validates :label, presence: true, allow_nil: false
  validates :node_number,presence: true, numericality: true, allow_blank: false, uniqueness: true
  validates :description, presence: true, allow_nil: false
end
