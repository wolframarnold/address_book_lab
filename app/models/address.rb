class Address < ActiveRecord::Base
  US_STATES = Carmen.states.map { |st| st.last }

  belongs_to :user
  attr_accessible :city, :state, :street, :zip, :user, :user_id

  validates :street, :state, :city, :zip, :user_id, presence: true
  validates :state, inclusion: US_STATES
  validates :zip, :format => /^\d+$/
end
