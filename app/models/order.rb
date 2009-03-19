class Order < ActiveRecord::Base
  set_table_name "Orders"
  set_primary_key "OrderID"
  
  belongs_to :customer, :class_name => "Customer", :foreign_key => "CustomerID"
  belongs_to :employee, :class_name => "Employee", :foreign_key => "EmployeeID"
  has_many :order_details, :class_name => "OrderDetail", :foreign_key => "OrderID"
  
  def total
    total = 0
    for detail in self.order_details
      detail_total = (detail.UnitPrice * detail.Quantity)
        if discount = detail.Discount.to_d
          detail_total = detail_total - (detail_total * discount)
        end  
      total = total + detail_total
    end  
    total
  end
end
