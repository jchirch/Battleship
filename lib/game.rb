class Game

    def initialize
        @player_board = Board.new
        @computer_board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
        @rubber_duckie = Ship.new("Duckie", 1)
    end

    def start
        welcome
        play_or_quit
        game_prompt
    end

    def welcome
        puts "Welcome to BATTLESHIP \n" +
        "Enter p to play. Enter q to quit."
    end

    def play_or_quit
        input = gets.chomp
        
        if input == "p"
            computer_placement
        elsif input == "q"
            exit
        else
            puts "Invalid input, enter 'p' or 'q'"
            play_or_quit
        end
    end

    def computer_placement
        @computer_board.place(@cruiser, ["A1", "A2", "A3"])
        @computer_board.place(@submarine, ["B1", "C1"])
        @computer_board.place(@rubber_duckie, ["D4"])
    end
#randomize later!

    def game_prompt
        puts "Ahoy Scallywag! I have laid out me fleet on the grid.\n" +
        "Ye now need to lay out yer 3 ships.\n" +
        "The Cruiser be three units long, the Submarine be two units long,\n" +
        "and the rubber duckie be only one unit.\n" +
        "\n" 

        puts @player_board.render(true) +
        
        "\n" +
        "Enter the squares for ye Cruiser (3 spaces):"
    end




    # def old_start
      
        
    
    
    #     
    
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