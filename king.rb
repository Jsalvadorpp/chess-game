require "./piece"

class King < Piece
    def initialize(color,x,y)
        super(color,"king",x,y,"K")
    end
end