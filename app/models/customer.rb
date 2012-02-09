class Customer < ActiveRecord::Base
  has_many :contacts
  has_many :jobs

  def to_s
    self.name
  end
end
