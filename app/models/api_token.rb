class ApiToken < ActiveRecord::Base
  validates :token, presence: true, allow_blank: false
end
