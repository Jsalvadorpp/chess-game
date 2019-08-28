require "./piece"

class Pawn < Piece
    def initialize(color)
        super(color,"pawn","P")
    end
end