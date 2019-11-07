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

  describe "games#destroy" do
  it "should allow a user forfeit a game" do
      user = FactoryBot.create(:user)
      sign_in user
      game = FactoryBot.create(:game)
      delete :destroy, params: { id: game.id }
      game = Game.find_by_id(game.id)

      expect(game).to eq nil
      expect(response).to redirect_to root_path
    end
  end

  describe 'capture_piece!' do
    it 'should set the captured piece to nill' do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      piece = FactoryBot.create(:piece, id: 1, location_x: 1, location_y: 2, game_id: game.id, player_id: game.user_id)
      piece.capture_piece!
      expect(piece.status).to eq("captured")
    end
  end

  describe 'update_piece_location!' do
    it 'should update the piece location' do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      piece = FactoryBot.create(:piece, id: 1, location_x: 1, location_y: 2, game_id: game.id, player_id: game.user_id, move_count: 0)
      piece.update_piece_location!(2, 4)

      expect(piece.location_x).to eq(2)
      expect(piece.location_y).to eq(4)
      expect(piece.move_count).to eq(1)
    end
  end
  
end
