require "./piece"

class Bishop < Piece
    def initialize(color)
        super(color,"bishop","♝")
    end

    def availableMoves_withoutCheck(board)
        moves = []

        x = self.pos.x-1
        y = self.pos.y-1 
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x-1
            y = y-1
        end

        x = self.pos.x+1
        y = self.pos.y-1
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x+1
            y = y-1
        end

        x = self.pos.x-1
        y = self.pos.y+1
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x-1
            y = y+1
        end

        x = self.pos.x+1
        y = self.pos.y+1
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x+1
            y = y+1
        end
        
        return moves
    end

    def allAvailableMoves(board)
        moves = availableMoves_withoutCheck(board)
        moves.select! { |move| board.kingIntoCheck(self,move[0],move[1]) == false}
        return moves
    end
end

