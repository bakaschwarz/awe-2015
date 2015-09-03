class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :generate_api_token

  def do_not_use_random_api!(arg)
    @dont_generate = arg
  end

  def dont_generate?
    @dont_generate
  end

  private
    def generate_api_token
      unless dont_generate?
          self.api_token = SecureRandom.hex
      end
    end
end
