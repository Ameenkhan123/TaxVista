class Accountant < ApplicationRecord
  has_many :customer_accountants
  has_many :customers, through: :customer_accountants
  validates :mobile,:presence => true,
            :uniqueness => true,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 10 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
