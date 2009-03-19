class Employee < ActiveRecord::Base
  set_table_name "Employees"
  set_primary_key "EmployeeID"
  
  has_many :orders, :foreign_key => "EmployeeID"
  belongs_to :manager, :class_name => "Manager", :foreign_key => "ReportsTo"
end
