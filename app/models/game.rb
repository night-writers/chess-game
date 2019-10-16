class Game < ApplicationRecord
  has_many :pieces
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
    @pawns = []
    for x in 1..8 do
      @pawns << Piece::Pawn.new(
        game_id: self.id,
        player_id: self.user_id,
        location_x: x,
        location_y: 2,
        status: "uncaptured"
      )
    end

    # rooks
    @rooks = []
      @rooks << Piece::Rook.new(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 1,
        location_y: 1,
        status: "uncaptured"
      )
      @rooks << Piece::Rook.new(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 8,
        location_y: 1,
        status: "uncaptured"
      )

    # knights
    @knights = []
      @knights << Piece::Knight.new(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 2,
        location_y: 1,
        status: "uncaptured"
      )
      @knights << Piece::Knight.new(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 7,
        location_y: 1,
        status: "uncaptured"
      )

    # bishops
    @bishops = []
      @bishops << Piece::Bishop.new(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 3,
        location_y: 1,
        status: "uncaptured"
      )
      @bishops << Piece::Bishop.new(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 6,
        location_y: 1,
        status: "uncaptured"
      )

    # king
    @kings = []
      @kings << Piece::King.new(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 5,
        location_y: 1,
        status: "uncaptured"
      )

    # queen
    @queens = []
      @queens << Piece::Queen.new(
        game_id: self.id,
        player_id: self.user_id,
        location_x: 4,
        location_y: 1,
        status: "uncaptured"
      )

  # black pieces
    # pawns
      for x in 1..8 do
        @pawns << Piece::Pawn.new(
          game_id: self.id,
          location_x: x,
          location_y: 7,
          status: "uncaptured"
        )
      end

    # rooks
      @rooks << Piece::Rook.new(
        game_id: self.id,
        location_x: 1,
        location_y: 8,
        status: "uncaptured"
      )
      @rooks << Piece::Rook.new(
        game_id: self.id,
        location_x: 8,
        location_y: 8,
        status: "uncaptured"
      )

    # knights
      @knights << Piece::Knight.new(
        game_id: self.id,
        location_x: 2,
        location_y: 8,
        status: "uncaptured"
      )
      @knights << Piece::Knight.new(
        game_id: self.id,
        location_x: 7,
        location_y: 8,
        status: "uncaptured"
      )

    # bishops
      @bishops << Piece::Bishop.new(
        game_id: self.id,
        location_x: 3,
        location_y: 8,
        status: "uncaptured"
      )
      @bishops << Piece::Bishop.new(
        game_id: self.id,
        location_x: 6,
        location_y: 8,
        status: "uncaptured"
      )

    # king
      @kings << Piece::King.new(
        game_id: self.id,
        location_x: 5,
        location_y: 8,
        status: "uncaptured"
      )

    # queen
      @queens << Piece::Queen.new(
        game_id: self.id,
        location_x: 4,
        location_y: 8,
        status: "uncaptured"
      )
  end
end

