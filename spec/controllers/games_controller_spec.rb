require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#new" do
    it "should successfully display the new game creation page if a user is signed in" do
      user = FactoryBot.create(:user)
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create" do
    it "should successfully add a new game to the database" do
      user = FactoryBot.create(:user)
      sign_in user
    
      post :create, params: {
        game: {
          name: 'Game Name'
        }
      }
      expect(response).to redirect_to root_path
    end
  end

  describe "games#show" do 
    it "should successfully show the specific game requested if the game is found" do
      game = FactoryBot.create(:game)
      get :show, params: { id: game.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#update" do 
    it "should successfully update the game black player id" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      sign_in user

      patch :update, params: { id: game.id, game: { black_player_id: user.id } }
      game.reload
      expect(game.black_player_id).to eq(user.id)
    end
  end
end
