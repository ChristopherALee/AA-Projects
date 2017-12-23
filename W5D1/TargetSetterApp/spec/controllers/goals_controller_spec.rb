require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  u = User.create(username: "user3", password: "123456")
  g = Goal.create(title: "isgoal", user_id: u.id)
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "shows the show page" do
      get :show, params: { id: g.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #edit" do
    it "shows the edit page" do
      get :edit, params: { id: g.id }
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #create" do
    context 'valid params ' do 
      it "creates a new goal" do
        post :create, params: { 
          goal: { 
            title: "title1", 
            user_id: u.id 
          }
        }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(goals_url)
      end
    end
    
    context 'invalid params' do 
      it "fails to create a goal" do 
        post :create, params: { goal: { title: "", 
          user_id: u.id }
        }
        
        expect(response).to render_template(:new)
        expect(flash.now[:errors]).to eq(["Title can't be blank"])
      end
    end 
  end

  describe "DELETE #destroy" do
    it "deletes a goal" do
      delete :destroy, params: { id: g.id }
      expect(response).to redirect_to(goals_url)
    end
  end


  describe "PATCH #update" do
    context 'valid params' do
      it "updates goal" do
        patch :update, params: { id: g.id, goal: { title: "edited title", user_id: u.id } }
        
        updated_goal = Goal.find_by(title: "edited title")
        
        expect(updated_goal.title).to eq("edited title")
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(goal_url(g.id))
      end
    end
    
    context 'invalid params' do
      it "doesn't update goal" do
        patch :update, params: { id: g.id, goal: { title: "", user_id: u.id}}
        
        expect(response).to render_template(:edit)
        expect(flash.now[:errors]).to eq(["Title can't be blank"])
      end
    end
    
  end

end
