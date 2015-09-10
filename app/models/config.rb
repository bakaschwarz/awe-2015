class Config < ActiveRecord::Base
  before_save :set_defaults

  private
    def set_defaults
      self.filter_range ||= 2*60*60
      self.filter_precision ||= 60
    end
end
