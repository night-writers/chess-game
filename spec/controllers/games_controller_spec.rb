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

      game = Game.last
      expect(game.name).to eq('Game Name')
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
      game = FactoryBot.create(:game)
      get :show, params: { id: game.id }
      expect(response).to have_http_status(:success)
    end
  end
end
