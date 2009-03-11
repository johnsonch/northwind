class Order < ActiveRecord::Base
  set_table_name "Orders"
  set_primary_key "OrderID"
  
  belongs_to :customer, :class_name => "Customer", :foreign_key => "CustomerID"
  belongs_to :employee, :class_name => "Employee", :foreign_key => "EmployeeID"
end
