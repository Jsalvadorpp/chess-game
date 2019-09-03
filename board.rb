require "./square"


class Board
    attr_accessor :whiteKing, :whitePieces
    attr_accessor :blackKing, :blackPieces
 
    def initialize
        @grid = Array.new(8) { Array.new(8) }
        @whiteKing = nil
        @blackKing = nil
        @whitePieces = []
        @blackPieces = []
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

    def squareInBoard_coords(x,y)
        return (x.between?(0,7) && y.between?(0,7)) ? true : false
    end

    def getSquare(name)
        return @grid.flatten.find { |square| square.name == name} 
    end

    def getSquare_coords(x,y)
        return @grid.flatten.find { |square| square.pos.x == x && square.pos.y == y} 
    end

    def getPiece_coords(x,y)
        return getSquare_coords(x,y).occupiedBy
    end

    def kingIntoCheck(piece,x,y)

            auxBoard = Marshal.load(Marshal.dump(self))

            originSquare = auxBoard.getSquare_coords(piece.pos.x,piece.pos.y)
            targetSquare = auxBoard.getSquare_coords(x,y)

            originSquare.occupiedBy = nil
            auxBoard.eliminateFromGame(targetSquare.occupiedBy) if targetSquare.occupiedBy != nil
            
            targetSquare.occupiedBy = piece
            
            if piece.type == "king"
                if piece.color == "white"
                    auxBoard.whiteKing.pos.x = targetSquare.pos.x 
                    auxBoard.whiteKing.pos.y = targetSquare.pos.y
                else
                    auxBoard.blackKing.pos.x = targetSquare.pos.x 
                    auxBoard.blackKing.pos.y = targetSquare.pos.y
                end
            end

            return check?(auxBoard,piece.color)
    end

    def eliminateFromGame(piece)
        @whitePieces.delete(piece) if piece.color == "white"
        @blackPieces.delete(piece) if piece.color == "black"
    end

    def check?(board,color)

        if color == "white"
            board.blackPieces.each do |piece|
                return true if piece.availableMoves_withoutCheck(board).include?([board.whiteKing.pos.x,board.whiteKing.pos.y])
            end
            return false
        else
            board.whitePieces.each do |piece|
                return true if piece.availableMoves_withoutCheck(board).include?([board.blackKing.pos.x,board.blackKing.pos.y])
            end
            return false
        end
    end

end



