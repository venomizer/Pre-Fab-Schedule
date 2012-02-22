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
      if self.priority < self.priority_was
        while self.class.find(:last, priority + 1).priority - self.priority == 1 and self.priority == self.priority.find(:all, priority)
          self.class.where("priority >= ?", self.priority).update_all("priority = priority + 1")
        end
      end

      if self.priority > self.priority_was
        while self.priority - self.class.find(:last, self.priority - 1).priority == 1
          self.class.where("priority >= ?", self.priority).update_all("priority = priority + 1")
          self.class.where("priority < ?", self.priority).update_all("priority = priority - 1")
        end
      end
    else
      nil
    end
  end
  
end
