class Job < ActiveRecord::Base
  include ActiveModel::Dirty
  belongs_to :customer
  has_many :job_items
  acts_as_list column: 'priority'
  before_validation :update_priorities, :update_job_items

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
    if self.priority_was == nil
      self.class.where("priority >= ?", self.priority).update_all("priority = priority + 1")
    else
      nil
    end

    if self.priority_changed? and self.priority_was != nil
      if self.priority < self.priority_was
        self.class.where("priority >= ?", self.priority).update_all("priority = priority + 1")
        self.class.where("priority > ?", self.priority_was).update_all("priority = priority - 1")
      else
        nil
      end
      if self.priority > self.priority_was and self.priority_was != nil
        self.class.where("priority <= ?", self.priority).update_all("priority = priority - 1")
        self.class.where("priority < ?", self.priority_was).update_all("priority = priority + 1")
      else
        nil
      end
    else
      nil
    end
  end

  def update_job_items
    if self.finished_changed?
      if self.finished
        self.job_items.update_all("finished = 1")
      else
        self.job_items.update_all("finished = 0")
      end
    end
  end

end
