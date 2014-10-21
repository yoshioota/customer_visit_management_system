class Employee < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise \
      :database_authenticatable,
      :registerable,
      :recoverable,
      :rememberable,
      :trackable,
      :validatable

  validates :email, presence: true


  has_many :customers_employees
  has_many :customers, through: :customers_employees

end
