class Customer < ActiveRecord::Base
  set_table_name "Customers"
  set_primary_key "CustomerID"
  
  has_many :orders, :foreign_key => "CustomerID"
  validates_uniqueness_of :CompanyName
  
  def before_create
    ## CustomerID needs to be a 5 char all upcase string, to match current DB layout
    self.CustomerID = (self.CompanyName.gsub(" ", "")[0,5]).upcase
  end
end
