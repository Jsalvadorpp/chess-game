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
            puts "  +----------------------------------------+"
            print "#{8-x} | "

            8.times do |y|
                print " #{@grid[x][y].name} |"
            end
            puts ""
        end
        puts "  +----------------------------------------+"
        print "   "
        ("a".."h").each {|c| print "  #{c}  " }
        puts ""
    end




end

#game = Board.new
#game.displayBoard()





