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
        player_ships
        
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
        computer_cruiser
        computer_submarine
        computer_duckie
    end

    def all_coordinates
        ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    end

    def computer_cruiser
        computer_input = all_coordinates.sample(3)
        if @computer_board.valid_placement?(@cruiser, computer_input)
            @computer_board.place(@cruiser, computer_input)
        else
            computer_cruiser
        end
    end

    def computer_submarine
        computer_input = all_coordinates.sample(2)
        if @computer_board.valid_placement?(@submarine, computer_input)
            @computer_board.place(@submarine, computer_input)
        else
            computer_submarine
        end
    end

    def computer_duckie
        computer_input = all_coordinates.sample(1)
        if @computer_board.valid_placement?(@rubber_duckie, computer_input)
            @computer_board.place(@rubber_duckie, computer_input)
        else
            computer_duckie
        end
    end
   
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

    def player_ships
        player_cruiser
        player_submarine
        player_rubber_duckie
    end

    def player_cruiser
        input = gets.chomp
        if @player_board.valid_placement?(@cruiser, input.split)
            @player_board.place(@cruiser, input.split)
            puts @player_board.render(true)
        else
            puts "Ye can't park here! Try again, scallywag!"
            player_cruiser
        end
    end

    def player_submarine
        puts "Enter the squares for ye Submarine (2 spaces):"
        input = gets.chomp
        if @player_board.valid_placement?(@submarine, input.split)
            @player_board.place(@submarine, input.split)
            puts @player_board.render(true)
        else
            puts "Ye can't park here! Try again, scallywag!"
            player_submarine
        end
    end

    def player_rubber_duckie
        puts "Enter the squares for ye rubber duckie (1 space):"
        input = gets.chomp
        if @player_board.valid_placement?(@rubber_duckie, input.split)
            @player_board.place(@rubber_duckie, input.split)
        else
            puts "Ye can't park here! Try again, scallywag!"
            player_rubber_duckie
        end
    end

    def turn
        boards_render
    end

    def boards_render
        puts "=============COMPUTER BOARD============= \n" +
        "#{@computer_board.render}" +
        "==============PLAYER BOARD============== \n" +
        "#{@player_board.render(true)}"
    end
end