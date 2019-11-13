class Game < ApplicationRecord
  has_many :pieces, dependent: :destroy
  has_many :comments
  after_initialize :init
  belongs_to :user, optional: true
  scope :available, -> { where(status: "available") }
  
  def init
    self.status ||= "available"
    self.white_player_id ||= self.user_id
    self.turn ||= self.user_id
  end

  def check?
    black_king = pieces.where(name: "blackking")
    white_king = pieces.where(name: "whiteking")

    pieces.each do |piece|
      if piece.valid_move?(piece.location_x, piece.location_y, black_king.location_x, black_king.location_y) && (piece.player_id != piece.game.black_player_id)
        return true
      end
      if piece.valid_move?(piece.location_x, piece.location_y, white_king.location_x, white_king.location_y) && (piece.player_id != piece.game.white_player_id)
        return true
      end
    end
    return false
  end

  def populate_game
  # white pieces
    # pawns
    for x in 1..8 do
      Piece.create(
        type: Pawn,
        game_id: self.id,
        player_id: self.user_id,
        location_x: x,
        location_y: 2,
        name: "whitepawn#{x}",
        image: "/assets/images/pieces/whitepawn.svg",
        status: "uncaptured",
        move_count: 0,
        color: "white"
      )
    end

    # rooks
      Piece.create(
        type: Rook,
        game_id: self.id,
        player_id: self.user_id,
        location_x: 1,
        location_y: 1,
        name: "whiterook1",
        image: "/assets/images/pieces/whiterook.svg",
        status: "uncaptured",
        move_count: 0,
        color: "white"
      )
      Piece.create(
        type: Rook,
        game_id: self.id,
        player_id: self.user_id,
        location_x: 8,
        location_y: 1,
        name: "whiterook2",
        image: "/assets/images/pieces/whiterook.svg",
        status: "uncaptured",
        move_count: 0,
        color: "white"
      )

    # knights
      Piece.create(
        type: Knight,
        game_id: self.id,
        player_id: self.user_id,
        location_x: 2,
        location_y: 1,
        name: "whiteknight1",
        image: "/assets/images/pieces/whiteknight.svg",
        status: "uncaptured",
        move_count: 0,
        color: "white"
      )
      Piece.create(
        type: Knight,
        game_id: self.id,
        player_id: self.user_id,
        location_x: 7,
        location_y: 1,
        name: "whiteknight2",
        image: "/assets/images/pieces/whiteknight.svg",
        status: "uncaptured",
        move_count: 0,
        color: "white"
      )

    # bishops
      Piece.create(
        type: Bishop,
        game_id: self.id,
        player_id: self.user_id,
        location_x: 3,
        location_y: 1,
        name: "whitebishop1",
        image: "/assets/images/pieces/whitebishop.svg",
        status: "uncaptured",
        move_count: 0,
        color: "white"
      )
      Piece.create(
        type: Bishop,
        game_id: self.id,
        player_id: self.user_id,
        location_x: 6,
        location_y: 1,
        name: "whitebishop2",
        image: "/assets/images/pieces/whitebishop.svg",
        status: "uncaptured",
        move_count: 0,
        color: "white"
      )

    # king
      Piece.create(
        type: King,
        game_id: self.id,
        player_id: self.user_id,
        location_x: 5,
        location_y: 1,
        name: "whiteking",
        image: "/assets/images/pieces/whiteking.svg",
        status: "uncaptured",
        move_count: 0,
        color: "white"
      )

    # queen
      Piece.create(
        type: Queen,
        game_id: self.id,
        player_id: self.user_id,
        location_x: 4,
        location_y: 1,
        name: "whitequeen",
        image: "/assets/images/pieces/whitequeen.svg",
        status: "uncaptured",
        move_count: 0,
        color: "white"
      )

  # black pieces
    # pawns
      for x in 1..8 do
        Piece.create(
          type: Pawn,
          game_id: self.id,
          location_x: x,
          location_y: 7,
          name: "blackpawn#{x}",
          image: "/assets/images/pieces/blackpawn.svg",
          status: "uncaptured",
          move_count: 0,
          color: "black"
        )
      end

    # rooks
      Piece.create(
        type: Rook,
        game_id: self.id,
        location_x: 1,
        location_y: 8,
        name: "blackrook1",
        image: "/assets/images/pieces/blackrook.svg",
        status: "uncaptured",
        move_count: 0,
        color: "black"
      )
      Piece.create(
        type: Rook,
        game_id: self.id,
        location_x: 8,
        location_y: 8,
        name: "blackrook2",
        image: "/assets/images/pieces/blackrook.svg",
        status: "uncaptured",
        move_count: 0,
        color: "black"
      )

    # knights
      Piece.create(
        type: Knight,
        game_id: self.id,
        location_x: 2,
        location_y: 8,
        name: "blackknight1",
        image: "/assets/images/pieces/blackknight.svg",
        status: "uncaptured",
        move_count: 0,
        color: "black"
      )
      Piece.create(
        type: Knight,
        game_id: self.id,
        location_x: 7,
        location_y: 8,
        name: "blackknight2",
        image: "/assets/images/pieces/blackknight.svg",
        status: "uncaptured",
        move_count: 0,
        color: "black"
      )

    # bishops
      Piece.create(
        type: Bishop,
        game_id: self.id,
        location_x: 3,
        location_y: 8,
        name: "blackbishop1",
        image: "/assets/images/pieces/blackbishop.svg",
        status: "uncaptured",
        move_count: 0,
        color: "black"
      )
      Piece.create(
        type: Bishop,
        game_id: self.id,
        location_x: 6,
        location_y: 8,
        name: "blackbishop2",
        image: "/assets/images/pieces/blackbishop.svg",
        status: "uncaptured",
        move_count: 0,
        color: "black"
      )

    # king
      Piece.create(
        type: King,
        game_id: self.id,
        location_x: 5,
        location_y: 8,
        name: "blackking",
        image: "/assets/images/pieces/blackking.svg",
        status: "uncaptured",
        move_count: 0,
        color: "black"
      )

    # queen
      Piece.create(
        type: Queen,
        game_id: self.id,
        location_x: 4,
        location_y: 8,
        name: "blackqueen",
        image: "/assets/images/pieces/blackqueen.svg",
        status: "uncaptured",
        move_count: 0,
        color: "black"
      )
  end
end

