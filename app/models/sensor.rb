class Sensor < ActiveRecord::Base
  has_many :sensor_data
  belongs_to :visualization_type
  belongs_to :station
  belongs_to :main_diagram
  before_save :set_defaults

  private
    def set_defaults
      self.visualization_type_id ||= 1
    end
end
