class Job < ActiveRecord::Base
  include ActiveModel::Dirty
  belongs_to :customer
  has_many :job_items
  acts_as_list column: 'priority'

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
      self.insert_at(self.priority)
      self.class.increment_positions_on_lower_items(self.priority)
    end
  end

end
