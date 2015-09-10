class Sensor < ActiveRecord::Base
  has_many :sensor_data
  belongs_to :visualization_type
  belongs_to :station
  before_save :set_defaults
  validates :sensor,presence: true, allow_blank: false
  validates :label,presence: true, allow_blank: false
  validates :abbreviation, presence: true, allow_blank: false
  validates :unit, presence: true, allow_blank: false

  private
    def set_defaults
      self.visualization_type_id ||= 1
    end
end
