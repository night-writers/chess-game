require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#new" do
    it "should successfully display the new game creation page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create" do
    it "should successfully add a new game to the database" do
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
      post :create, params: {
        game: {
          name: 'Game Name'
        }
      }
      patch :update, params: { name: 'Game Name', game: { black_player_id: '1' } }
      expect(game.black_player_id).to eq('1')
      expect(response).redirect_back(fallback_location: root_path)
    end
  end
end
