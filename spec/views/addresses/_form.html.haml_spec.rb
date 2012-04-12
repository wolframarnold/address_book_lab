require "spec_helper"

describe 'addresses/_form' do

  it 'should have a hidden field with user_id' do
    address = FactoryGirl.build(:address)
    assign(:address, address)

    render

    rendered.should have_selector("input[name='address[user_id]'][type='hidden'][value='#{address.user_id}']")
  end
end