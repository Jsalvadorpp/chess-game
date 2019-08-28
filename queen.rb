require "./piece"

class Queen < Piece
    def initialize(color,x,y)
        super(color,"queen",x,y,"Q")
    end
end