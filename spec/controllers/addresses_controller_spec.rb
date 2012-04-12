require 'spec_helper'

describe AddressesController do
  before do
    @address = FactoryGirl.create(:address)
    @user = @address.user
  end

  describe "GET 'new'" do
    before do
      get :new, user_id: @user.id
    end
    it 'responds with success' do
      response.should be_success
    end
    it 'displays the "new" form' do
      response.should render_template("new")
    end
    it 'assigns @address with user set' do
      assigns(:address).should be_instance_of(Address)
      assigns(:address).user_id.should == @user.id
    end
  end

  describe "GET 'edit'" do
    it 'sets @address' do
      get :edit, :id => @address.id
      assigns(:address).should == @address
    end
  end

  describe "POST 'create'" do
    let(:valid_params) { {address: FactoryGirl.attributes_for(:address).merge(user_id: @user.id)} }
    describe "when data is valid" do
      it 'saves the address' do
        expect {
          post :create, valid_params
        }.to change{@user.addresses.count}.by(1)
      end
      it 'redirects to user show page' do
        post :create, valid_params
        response.should redirect_to(user_path(@user))
      end
    end

    describe "when data is invalid" do
      it 'does not save the address' do
        expect {
          post :create, address: {}
        }.to_not change {Address.count}
      end
      it 'returns to the "new" page' do
        post :create, address: {}
        response.should render_template('new')
      end
    end
  end

  describe "PUT 'update'" do

    describe "when data is valid" do
      let(:valid_params) { { id: @address.id,
                             address: {city: 'Bend', state: 'OR'} } }
      it 'updates the address' do
        expect {
        expect {
          put :update, valid_params
        }.to change{@address.reload.city}.from('San Francisco').to('Bend')
        }.to change{@address.reload.state}.from('CA').to('OR')
      end
      it 'redirects to user show page' do
        put :update, valid_params
        response.should redirect_to(user_path(@user))
      end
    end

    describe "when data is invalid" do
      let(:invalid_params) { { id: @address.id,address: {city: ""} } }
      it 'does not update the address' do
        expect {
          put :update, invalid_params
        }.to_not change{@address.reload.city}.from('San Francisco')
      end
      it 'returns to the "edit" page' do
        put :update, invalid_params
        response.should render_template('edit')
      end
    end
  end

  describe "DELETE 'destroy'" do
    before do
      delete :destroy, id: @address.id
    end
    it 'removes the address record' do
      Address.where(id: @address.id).first.should be_nil
    end
    it 'redirects to user show page' do
      response.should redirect_to(user_path(@user))
    end
  end
end
