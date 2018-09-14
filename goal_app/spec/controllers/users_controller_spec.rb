require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET#new" do
    it "renders the new users template" do 
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST#create" do
    context "with valid params" do
      it "logs user in" do
        #User.create(username: 'Matt' password: 'password')
        post :create params: {user: {username: 'Matt', password: 'password'}}
        user = User.find_by(username: 'Matt')
        expect(session[:session_token]).to eq(user.session_token)
      end
      
      it 'redirects to the user show page' do
        post :create params: {user: {username: 'Matt', password: 'password'}}
        user = User.find_by(username: 'Matt')
        expect(response).to redirect_to(user_url(user))
      end
    end
    
    context "with invalid params" do
      it 'validates the presence of password and renders show page with flash errors' do
        post :create params: {user: {username: 'Matt'}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end
end
