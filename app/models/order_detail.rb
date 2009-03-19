class OrderDetail < ActiveRecord::Base
  set_table_name "Order Details"
  set_primary_key "OrderID"
  
  belongs_to :order, :class_name => "Order", :foreign_key => "OrderID"
end
