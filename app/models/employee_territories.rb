class EmployeeTerritories < ActiveRecord::Base
  set_table_name "EmployeeTerritories"
  belongs_to :employee, :class_name => "Employee", :foreign_key => "EmployeeID"
  belongs_to :territory, :class_name => "Territory", :foreign_key => "TerritoryID"
end
