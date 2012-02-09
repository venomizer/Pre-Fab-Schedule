class JobItem < ActiveRecord::Base
  belongs_to :job
  belongs_to :machine
end
