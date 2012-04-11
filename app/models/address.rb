class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :city, :state, :street, :zip, :user

  validates :street, :state, :city, :zip, :user, presence: true
  validates :state, inclusion: Carmen.states.map{|st|st.last}
  validates :zip, :format => /^\d+$/
end
