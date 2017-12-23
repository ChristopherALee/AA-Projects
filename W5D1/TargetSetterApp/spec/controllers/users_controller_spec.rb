require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it "renders a new page" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end
  
  describe 'POST #create' do
    context 'valid params' do
      it 'creates new user' do
        post :create, params: { 
          user: { 
            username: "user1", 
            password: "123456" 
            } 
          }

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(goals_url)
      end
    end
      
    context 'invalid params' do
      it "fails to create new user" do
        post :create, params: { user: { username: "user2", password: "12345"}}
        expect(response).to render_template(:new)
        expect(flash.now[:errors]).to eq(["Password is too short (minimum is 6 characters)"])
      end
    end
    
  end
end
