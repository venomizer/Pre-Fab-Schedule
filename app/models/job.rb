class Job < ActiveRecord::Base
  belongs_to :customer
  has_many :job_items
  
  before_validation :update_priorities
  
  validates :priority, :uniqueness => true
  
  private 
  
  def update_priorities
    self.class.where("priority >= ?", self.priority).update_all("priority = priority + 1")
  end
  
end
