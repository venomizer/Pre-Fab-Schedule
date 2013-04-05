class Job < ActiveRecord::Base
  include ActiveModel::Dirty
  belongs_to :customer
  has_many :job_items
  acts_as_list column: 'priority'
  before_validation :update_job_items
  before_save :bottom_it


  def self.search(search)
    if search
      where('number LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  private

  def bottom_it
    if self.finished_changed? && !self.last?
      if self.finished
        self.move_to_bottom
      else
      end
    else
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
