class Config < ActiveRecord::Base
  validates :user_id, presence: true, allow_blank: false, uniqueness: true
  validates :filter_range, presence: true, allow_blank: false, numericality: true
end
