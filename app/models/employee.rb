class Employee < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # if ENV['ADMIN_REGISTRATION'].to_i == 1
    DEVISE_OPTIONS = [
        :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :trackable,
        :validatable
    ]
  # else
  #   DEVISE_OPTIONS = [
  #       :database_authenticatable,
  #       # :registerable,
  #       :recoverable,
  #       :rememberable,
  #       :trackable,
  #       :validatable
  #   ]
  # end
  devise(* DEVISE_OPTIONS)

  validates :name, presence: true
  validates :email, presence: true

  has_many :customers_employees
  has_many :customers, through: :customers_employees

end
