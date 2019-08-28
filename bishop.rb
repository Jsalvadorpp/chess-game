require "./piece"

class Bishop < Piece
    def initialize(color,x,y)
        super(color,"bishop",x,y,"B")
    end
end

