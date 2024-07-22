class Game

    def start
        welcome
        play_or_quit
    end

    def welcome
        puts "Welcome to BATTLESHIP \n" +
        "Enter p to play. Enter q to quit."
    end

    def play_or_quit
        unless gets.chomp == "q"
        end
    end



    # def old_start
      
        # @computer_board.place(@cruiser, ["A1", "A2", "A3"])
        # @computer_board.place(@submarine, ["B1", "C1"])
        # @computer_board.place(@rubber_duckie, ["D4"])
    
    
    #     puts "Ahoy Scallywag! I have laid out me fleet on the grid.\n" +
    #     "Ye now need to lay out yer 3 ships.\n" +
    #     "The Cruiser be three units long, the Submarine be two units long,\n" +
    #     "and the rubber duckie be only one unit.\n" +
    #     "\n" +
    #     "  1 2 3 4\n" +
    #     "A . . . .\n" +
    #     "B . . . .\n" +
    #     "C . . . .\n" +
    #     "D . . . .\n" +
    #     "\n" +
    #     "Enter the squares for the Cruiser (3 spaces):"
    
    #     @user_response_1 = gets.chomp
        
    #     if @player_board.valid_placement?(@cruiser, @user_response_1.split)
    #         @player_board.place(@cruiser, @user_response_1.split)
    #     else
    #         puts "Ye can't park here! Try again, scallywag!"
    #     end
    
    #     puts @computer_board.render(true)
    #     puts @player_board.render(true)
    
    #     end
    # end
    

end