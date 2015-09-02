class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :generate_api_key

  private
    def generate_api_key
      self.api_token = SecureRandom.hex
    end
end
