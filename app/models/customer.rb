class Customer < ActiveRecord::Base

  validates :name, presence: true, length: {maximum: 255}
  validates :address, presence: true, length: {maximum: 255}
  validates :tel, presence: true, length: {maximum: 20}

  has_many :visit_histories

  has_many :customers_employees
  has_many :employees, through: :customers_employees
end
