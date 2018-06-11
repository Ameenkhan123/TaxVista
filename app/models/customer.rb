class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :mobile,:presence => true,
            :uniqueness => true,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 10 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
