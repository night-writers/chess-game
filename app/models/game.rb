class Game < ApplicationRecord
  has_many :pieces, dependent: :destroy
  has_many :comments
  after_initialize :init
  belongs_to :user, optional: true
  scope :available, -> { where(status: "available") }
  
  def init
    self.status ||= "available"
    self.white_player_id ||= self.user_id
  end

  def populate_game
  # white pieces
    # pawns
    for x in 1..8 do
      Piece::Pawn.create(
        game_id: self.id,
        player_id: self.user_id,
        location_x: x,
        location_y: 2,
        status: "uncaptured"
      )
    end

    # rooks
      Piece::Rook.create(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 1,
        location_y: 1,
        status: "uncaptured"
      )
      Piece::Rook.create(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 8,
        location_y: 1,
        status: "uncaptured"
      )

    # knights
      Piece::Knight.create(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 2,
        location_y: 1,
        status: "uncaptured"
      )
      Piece::Knight.create(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 7,
        location_y: 1,
        status: "uncaptured"
      )

    # bishops
      Piece::Bishop.create(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 3,
        location_y: 1,
        status: "uncaptured"
      )
      Piece::Bishop.create(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 6,
        location_y: 1,
        status: "uncaptured"
      )

    # king
      Piece::King.create(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 5,
        location_y: 1,
        status: "uncaptured"
      )

    # queen
      Piece::Queen.create(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 4,
        location_y: 1,
        status: "uncaptured"
      )

  # black pieces
    # pawns
      for x in 1..8 do
        Piece::Pawn.create(
          game_id: self.id,
          location_x: x,
          location_y: 7,
          status: "uncaptured"
        )
      end

    # rooks
      Piece::Rook.create(
        game_id: self.id,
        location_x: 1,
        location_y: 8,
        status: "uncaptured"
      )
      Piece::Rook.create(
        game_id: self.id,
        location_x: 8,
        location_y: 8,
        status: "uncaptured"
      )

    # knights
      Piece::Knight.create(
        game_id: self.id,
        location_x: 2,
        location_y: 8,
        status: "uncaptured"
      )
      Piece::Knight.create(
        game_id: self.id,
        location_x: 7,
        location_y: 8,
        status: "uncaptured"
      )

    # bishops
      Piece::Bishop.create(
        game_id: self.id,
        location_x: 3,
        location_y: 8,
        status: "uncaptured"
      )
      Piece::Bishop.create(
        game_id: self.id,
        location_x: 6,
        location_y: 8,
        status: "uncaptured"
      )

    # king
      Piece::King.create(
        game_id: self.id,
        location_x: 5,
        location_y: 8,
        status: "uncaptured"
      )

    # queen
      Piece::Queen.create(
        game_id: self.id,
        location_x: 4,
        location_y: 8,
        status: "uncaptured"
      )
  end
end

