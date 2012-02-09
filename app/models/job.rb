class Job < ActiveRecord::Base
  belongs_to :customer
  has_many :job_items
  validates :priority, :uniqueness => true

  def priority_update(n)
    Job.where("priority >=?",n).update_all("priority = priority + 1")
  end

end
