class Config < ActiveRecord::Base
  before_save :set_defaults
  validates :user_id, presence: true, allow_blank: false, uniqueness: true
  validates :filter_range, presence: true, allow_blank: false, numericality: true

  private
    def set_defaults
      self.filter_range ||= 2*60*60
    end
end
