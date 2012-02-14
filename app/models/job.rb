class Job < ActiveRecord::Base
  include ActiveModel::Dirty
  belongs_to :customer
  has_many :job_items

  before_validation :update_priorities

  validates :priority, :uniqueness => true

  def self.search(search)
    if search
      where('number LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  private

  def update_priorities
    if self.priority_changed?
      self.class.where("priority >= ?", self.priority).update_all("priority = priority + 1")
    else
      nil
    end

  end
  
end
