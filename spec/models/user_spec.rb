require 'spec_helper'

describe User do

  describe 'Validations' do
    %w(first_name last_name).each do |attr|
      it "requires #{attr}" do
        should_not be_valid
        subject.errors[attr].should_not be_empty
      end
    end
  end


  describe 'Associations' do

    it "responds to :addresses" do
      should respond_to(:addresses)
    end

    it "can create an addresse" do
      user = FactoryGirl.create(:user)
      expect {
        user.addresses.create(FactoryGirl.attributes_for(:address))
      }.should change{user.addresses.count}.by(1)
    end

  end

end
