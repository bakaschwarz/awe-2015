class Sensor < ActiveRecord::Base
  has_many :sensor_data
  belongs_to :visualization_type
  belongs_to :station
  before_save :set_defaults

  private
    def set_defaults
      self.visualization_type_id ||= 1
      self.active ||= true
    end
end
