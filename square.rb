class Square
    attr_reader :name, :pos
    attr_accessor :occupiedBy

    def initialize(name,x,y)
        @name = name
        @pos = PositionInBoard.new(x,y)
        @occupiedBy = nil
    end

end

class PositionInBoard
    attr_reader :x,:y

    def initialize(x,y)
        @x = x
        @y = y
    end
end

