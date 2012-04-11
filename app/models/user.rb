class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name, :last_name, presence: true

  has_many :addresses
end
