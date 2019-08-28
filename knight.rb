require "./piece"

class Knight < Piece
    def initialize(color,x,y)
        super(color,"knight",x,y,"L")
    end
end