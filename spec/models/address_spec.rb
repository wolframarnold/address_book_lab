require 'spec_helper'

describe Address do
  describe 'Validations' do
    subject { FactoryGirl.build(:address) }

    %w(street city state zip).each do |attr|
      it "requires #{attr}" do
        subject.send("#{attr}=", nil)
        should_not be_valid
        subject.errors[attr].should_not be_empty
      end
    end

    it 'requires state to be valid 2-letter abbreviation' do
      subject.state = 'ABC'
      should_not be_valid
      subject.errors[:state].should_not be_empty
    end

    it 'require zip to be numerical' do
      subject.zip = 'ABCDEF'
      should_not be_valid
      subject.errors[:zip].should_not be_empty
    end
  end


  describe 'Associations' do

    it "responds to :addresses" do
      should respond_to(:user)
    end

  end

end
