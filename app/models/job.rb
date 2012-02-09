class Job < ActiveRecord::Base
  belongs_to :customer
  has_many :job_items
  validates :priority, :uniqueness => true
end
