require "./piece"

class Rook < Piece
    def initialize(color,x,y)
        super(color,"rook",x,y,"R")
    end
end
