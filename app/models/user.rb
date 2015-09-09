class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :set_defaults

  private
    def set_defaults
      self.filter_range ||= 2*60*60
      self.filter_precision ||= 60
    end
end
