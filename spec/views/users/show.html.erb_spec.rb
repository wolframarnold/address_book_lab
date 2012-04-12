require 'spec_helper'

describe '/users/show' do

  it 'has a link to New Address with user_id param' do

    assign(:user, FactoryGirl.create(:user))

    render

    rendered.should have_selector('a[href="/addresses/new?user_id=1"]')

  end

end
