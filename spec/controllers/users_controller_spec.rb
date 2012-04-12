require 'spec_helper'

describe UsersController do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "sets @users" do
      get :index
      assigns(:users).should == [@user]
    end
  end

  describe "GET 'new'" do
    it 'responds with success' do
      get :new
      response.should be_success
    end
    it 'displays the "new" form' do
      get :new
      response.should render_template("new")
    end
    it 'assigns @user' do
      get :new
      assigns(:user).should be_instance_of(User)
    end
  end

  describe "GET 'show'" do
    it 'sets @user' do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    it 'renders "show" template' do
      get :show, :id => @user.id
      response.should render_template('show')
    end
  end

  describe "GET 'edit'" do
    it 'sets @user' do
      get :edit, :id => @user.id
      assigns(:user).should == @user
    end
  end

  describe "POST 'create'" do

    describe "when data is valid" do
      it 'saves the user' do
        expect {
          post :create,
               user: {first_name: "Joe", last_name: "Smith"}
        }.to change{User.count}.by(1)
      end
      it 'redirects to show page' do
        post :create, user: {first_name: "Joe", last_name: "Smith"}
        response.should redirect_to(user_path(assigns(:user).id))
      end
    end

    describe "when data is invalid" do
      it 'does not save the user' do
        expect {
          post :create, user: {}
        }.to_not change {User.count}
      end
      it 'returns to the "new" page' do
        post :create, user: {}
        response.should render_template('new')
      end
    end
  end

  describe "PUT 'update'" do

    describe "when data is valid" do
      let(:valid_params) { { id: @user.id,
                             user: {first_name: "Sally", last_name: "Parker"} } }
      it 'updates the user' do
        expect {
        expect {
          put :update, valid_params
        }.to change{@user.reload.first_name}.from('Joe').to('Sally')
        }.to change{@user.reload.last_name}.from('Smith').to('Parker')
      end
      it 'redirects to show page' do
        put :update, valid_params
        response.should redirect_to(user_path(assigns(:user).id))
      end
    end

    describe "when data is invalid" do
      let(:invalid_params) { { id: @user.id,
                               user: {first_name: "", last_name: ""} } }
      it 'does not update the user' do
        expect {
          put :update, invalid_params
        }.to_not change{@user.reload.first_name}.from('Joe')
      end
      it 'returns to the "edit" page' do
        put :update, invalid_params
        response.should render_template('edit')
      end
    end
  end

  describe "DELETE 'destroy'" do
    before do
      delete :destroy, id: @user.id
    end
    it 'removes the user record' do
      User.where(id: @user.id).first.should be_nil
    end
    it 'redirects to index page' do
      response.should redirect_to(users_path)
    end
  end
end
