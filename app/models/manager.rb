class Manager < ActiveRecord::Base
  set_table_name "Employees"
  set_primary_key "EmployeeID"
  
  has_many :employees, :class_name => "employee", :foreign_key => "EmployeeID"
end
