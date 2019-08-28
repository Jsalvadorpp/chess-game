require "./square"

class Piece
    attr_reader :color, :type , :symbol
    attr_accessor :pos

    def initialize(color,type,x,y,symbol)
        @color = color
        @type = type
        @pos = PositionInBoard.new(x,y)
        @symbol = symbol
    end

    def moveTo(coordsName)
        raise NotImplementedError, "you must implement the method"
    end

    def deleteFromGame
        raise NotImplementedError, "you must implement the method"
    end
end

