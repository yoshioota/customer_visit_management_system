class VisitHistory < ActiveRecord::Base

  belongs_to :customer
  belongs_to :visited_employee, class_name: Employee.name

end
