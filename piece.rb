require "./square"
require "colorize"

class Piece
    attr_reader :color, :type , :symbol
    attr_accessor :pos

    def initialize(color,type,symbol)
        @color = color
        @type = type
        @pos = PositionInBoard.new(nil,nil)
        @symbol = @color == "black" ? "  #{symbol}  ".colorize(:white).on_black : "  #{symbol}  ".colorize(:black).on_white
    end

    def moveTo(coordsName)
        raise NotImplementedError, "you must implement the method"
    end

    def deleteFromGame
        raise NotImplementedError, "you must implement the method"
    end
end

