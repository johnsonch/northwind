class Region < ActiveRecord::Base
  set_table_name "Region"
  set_primary_key "RegionID"
  has_many :territories, :foreign_key => "RegionID"
end
