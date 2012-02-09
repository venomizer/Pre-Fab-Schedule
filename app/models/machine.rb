class Machine < ActiveRecord::Base
  has_many :job_items
end
