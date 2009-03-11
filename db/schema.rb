# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "Categories", :id => false, :force => true do |t|
    t.integer "CategoryID",                 :null => false
    t.string  "CategoryName", :limit => 30, :null => false
    t.text    "Description"
    t.binary  "Picture"
  end

  add_index "Categories", ["CategoryName"], :name => "CategoryName"

  create_table "CustomerCustomerDemo", :id => false, :force => true do |t|
    t.string "CustomerID",     :limit => 10, :null => false
    t.string "CustomerTypeID", :limit => 20, :null => false
  end

  create_table "CustomerDemographics", :id => false, :force => true do |t|
    t.string "CustomerTypeID", :limit => 20, :null => false
    t.text   "CustomerDesc"
  end

  create_table "Customers", :id => false, :force => true do |t|
    t.string "CustomerID",   :limit => 10,  :null => false
    t.string "CompanyName",  :limit => 80,  :null => false
    t.string "ContactName",  :limit => 60
    t.string "ContactTitle", :limit => 60
    t.string "Address",      :limit => 120
    t.string "City",         :limit => 30
    t.string "Region",       :limit => 30
    t.string "PostalCode",   :limit => 20
    t.string "Country",      :limit => 30
    t.string "Phone",        :limit => 48
    t.string "Fax",          :limit => 48
  end

  add_index "Customers", ["City"], :name => "City"
  add_index "Customers", ["CompanyName"], :name => "CompanyName"
  add_index "Customers", ["PostalCode"], :name => "PostalCode"
  add_index "Customers", ["Region"], :name => "Region"

  create_table "EmployeeTerritories", :id => false, :force => true do |t|
    t.integer "EmployeeID",                :null => false
    t.string  "TerritoryID", :limit => 40, :null => false
  end

  create_table "Employees", :id => false, :force => true do |t|
    t.integer  "EmployeeID",                     :null => false
    t.string   "LastName",        :limit => 40,  :null => false
    t.string   "FirstName",       :limit => 20,  :null => false
    t.string   "Title",           :limit => 60
    t.string   "TitleOfCourtesy", :limit => 50
    t.datetime "BirthDate"
    t.datetime "HireDate"
    t.string   "Address",         :limit => 120
    t.string   "City",            :limit => 30
    t.string   "Region",          :limit => 30
    t.string   "PostalCode",      :limit => 20
    t.string   "Country",         :limit => 30
    t.string   "HomePhone",       :limit => 48
    t.string   "Extension",       :limit => 8
    t.binary   "Photo"
    t.text     "Notes"
    t.integer  "ReportsTo"
    t.string   "PhotoPath",       :limit => 510
  end

  add_index "Employees", ["LastName"], :name => "LastName"
  add_index "Employees", ["PostalCode"], :name => "PostalCode"

  create_table "Order Details", :id => false, :force => true do |t|
    t.integer "OrderID",                                 :null => false
    t.integer "ProductID",                               :null => false
    t.decimal "UnitPrice",              :default => 0.0, :null => false
    t.integer "Quantity",               :default => 1,   :null => false
    t.float   "Discount",  :limit => 4, :default => 0.0, :null => false
  end

  add_index "Order Details", ["OrderID"], :name => "OrderID"
  add_index "Order Details", ["OrderID"], :name => "OrdersOrder_Details"
  add_index "Order Details", ["ProductID"], :name => "ProductID"
  add_index "Order Details", ["ProductID"], :name => "ProductsOrder_Details"

  create_table "Orders", :id => false, :force => true do |t|
    t.integer  "OrderID",                                        :null => false
    t.string   "CustomerID",     :limit => 10
    t.integer  "EmployeeID"
    t.datetime "OrderDate"
    t.datetime "RequiredDate"
    t.datetime "ShippedDate"
    t.integer  "ShipVia"
    t.decimal  "Freight",                       :default => 0.0
    t.string   "ShipName",       :limit => 80
    t.string   "ShipAddress",    :limit => 120
    t.string   "ShipCity",       :limit => 30
    t.string   "ShipRegion",     :limit => 30
    t.string   "ShipPostalCode", :limit => 20
    t.string   "ShipCountry",    :limit => 30
  end

  add_index "Orders", ["CustomerID"], :name => "CustomerID"
  add_index "Orders", ["CustomerID"], :name => "CustomersOrders"
  add_index "Orders", ["EmployeeID"], :name => "EmployeeID"
  add_index "Orders", ["EmployeeID"], :name => "EmployeesOrders"
  add_index "Orders", ["OrderDate"], :name => "OrderDate"
  add_index "Orders", ["ShipPostalCode"], :name => "ShipPostalCode"
  add_index "Orders", ["ShipVia"], :name => "ShippersOrders"
  add_index "Orders", ["ShippedDate"], :name => "ShippedDate"

  create_table "Products", :id => false, :force => true do |t|
    t.integer "ProductID",                                        :null => false
    t.string  "ProductName",     :limit => 80,                    :null => false
    t.integer "SupplierID"
    t.integer "CategoryID"
    t.string  "QuantityPerUnit", :limit => 40
    t.decimal "UnitPrice",                     :default => 0.0
    t.integer "UnitsInStock",                  :default => 0
    t.integer "UnitsOnOrder",                  :default => 0
    t.integer "ReorderLevel",                  :default => 0
    t.boolean "Discontinued",                  :default => false, :null => false
  end

  add_index "Products", ["CategoryID"], :name => "CategoriesProducts"
  add_index "Products", ["CategoryID"], :name => "CategoryID"
  add_index "Products", ["ProductName"], :name => "ProductName"
  add_index "Products", ["SupplierID"], :name => "SupplierID"
  add_index "Products", ["SupplierID"], :name => "SuppliersProducts"

  create_table "Region", :id => false, :force => true do |t|
    t.integer "RegionID",                         :null => false
    t.string  "RegionDescription", :limit => 100, :null => false
  end

  create_table "Shippers", :id => false, :force => true do |t|
    t.integer "ShipperID",                 :null => false
    t.string  "CompanyName", :limit => 80, :null => false
    t.string  "Phone",       :limit => 48
  end

  create_table "Suppliers", :id => false, :force => true do |t|
    t.integer "SupplierID",                  :null => false
    t.string  "CompanyName",  :limit => 80,  :null => false
    t.string  "ContactName",  :limit => 60
    t.string  "ContactTitle", :limit => 60
    t.string  "Address",      :limit => 120
    t.string  "City",         :limit => 30
    t.string  "Region",       :limit => 30
    t.string  "PostalCode",   :limit => 20
    t.string  "Country",      :limit => 30
    t.string  "Phone",        :limit => 48
    t.string  "Fax",          :limit => 48
    t.text    "HomePage"
  end

  add_index "Suppliers", ["CompanyName"], :name => "CompanyName"
  add_index "Suppliers", ["PostalCode"], :name => "PostalCode"

  create_table "Territories", :id => false, :force => true do |t|
    t.string  "TerritoryID",          :limit => 40,  :null => false
    t.string  "TerritoryDescription", :limit => 100, :null => false
    t.integer "RegionID",                            :null => false
  end

end
