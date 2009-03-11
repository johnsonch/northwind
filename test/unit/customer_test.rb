require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # # Replace this with your real tests.
  # test "the truth" do
  #   assert true
  # end
  
  
  def test_should_be_able_to_create_customer
    @customer = Customer.new(
                             :CompanyName => "Inacom", 
                             :ContactName => "Chris Johnson", 
                             :ContactTitle => "Solutions Developer",
                             :Address => "3001 W. Beltline HWY",
                             :City => "Madison",
                             :Country => "USA",
                             :Phone => "608.555.5555",
                             :Fax => "608.555.5555")
    assert @customer.save
    
    assert_equal(@customer.CustomerID, Customer.find_by_CompanyName("Inacom").CustomerID)
    assert_equal("INACO", Customer.find_by_CompanyName("Inacom").CustomerID)
  end
  
  def test_should_not_create_company_with_same_primary_key
    @customer = Customer.new(
                             :CompanyName => "Inacom", 
                             :ContactName => "Chris Johnson", 
                             :ContactTitle => "Solutions Developer",
                             :Address => "3001 W. Beltline HWY",
                             :City => "Madison",
                             :Country => "USA",
                             :Phone => "608.661.7731",
                             :Fax => "608.661.7701")
    assert @customer.save
    
    assert_equal(@customer.CustomerID, Customer.find_by_CompanyName("Inacom").CustomerID)
    @customer2 = Customer.new(
                             :CompanyName => "Inacom", 
                             :ContactName => "Chris Johnson", 
                             :ContactTitle => "Solutions Developer",
                             :Address => "3001 W. Beltline HWY",
                             :City => "Madison",
                             :Country => "USA",
                             :Phone => "608.661.7731",
                             :Fax => "608.661.7701")
    assert !@customer2.save
    
  end
end
