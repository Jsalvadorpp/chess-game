require "./square"

class Board
    
    def initialize
        @grid = Array.new(8) { Array.new(8) }
        setBoard()
    end

    def setBoard
        8.times do |x|
            letters = ("a".."h").to_a
            8.times {|y| @grid[x][y] = Square.new("#{letters.shift()}#{8-x}",x,y)}
        end
    end

    def displayBoard
        8.times do |x|
            puts "  +-----------------------------------------------+"
            print "#{8-x} |"

            8.times do |y|
                pieceSymbol = (@grid[x][y].occupiedBy.nil?) ? "  -  " : @grid[x][y].occupiedBy.symbol
                print "#{pieceSymbol}|"
            end
            puts ""
        end
        puts "  +-----------------------------------------------+"
        print "  "
        ("a".."h").each {|c| print "   #{c}  " }
        puts ""
    end

    def setPieceAt(piece,x,y)
        @grid[x][y].occupiedBy = piece
        piece.pos.x = x
        piece.pos.y = y
    end

    def squareInBoard?(name)
        result = @grid.flatten.find {|square| square.name == name}
        return (result.nil?) ? false : true 
    end

    def getSquare(name)
        return @grid.flatten.find { |square| square.name == name} 
    end






end

#game = Board.new
#puts game.getSquare("a3")
#game.displayBoard()




