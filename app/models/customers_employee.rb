class CustomersEmployee < ActiveRecord::Base
  belongs_to :customer
  belongs_to :employee
end
