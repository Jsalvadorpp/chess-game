require "./piece"

class Pawn < Piece
    def initialize(color,x,y)
        super(color,"pawn",x,y,"P")
    end
end