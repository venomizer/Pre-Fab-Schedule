class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: /@technicoolsystems.com^/ , message: "Please use your Technicool Email!"
end
