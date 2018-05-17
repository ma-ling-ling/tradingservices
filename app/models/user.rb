class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :services, dependent: :destroy
  has_many :orders, dependent: :destroy 

  before_create :default_points   #to learn about this, googled: rails devise set default attribute 

  def default_points
  	self.point_bank = 1000
  end
         
end
