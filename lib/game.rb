class Game

    def initialize
        @player_board = Board.new
        @computer_board = Board.new
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        @player_rubber_duckie = Ship.new("Duckie", 1)
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        @computer_rubber_duckie = Ship.new("Duckie", 1)
    end

    def start
        welcome
        play_or_quit
        game_prompt
        player_ships
        game_play
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
        if @computer_board.valid_placement?(@computer_cruiser, computer_input)
            @computer_board.place(@computer_cruiser, computer_input)
        else
            computer_cruiser
        end
    end

    def computer_submarine
        computer_input = all_coordinates.sample(2)
        if @computer_board.valid_placement?(@computer_submarine, computer_input)
            @computer_board.place(@computer_submarine, computer_input)
        else
            computer_submarine
        end
    end

    def computer_duckie
        computer_input = all_coordinates.sample(1)
        if @computer_board.valid_placement?(@computer_rubber_duckie, computer_input)
            @computer_board.place(@computer_rubber_duckie, computer_input)
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
        if @player_board.valid_placement?(@player_cruiser, input.split)
            @player_board.place(@player_cruiser, input.split)
            puts @player_board.render(true)
        else
            puts "Ye can't park here! Try again, scallywag!"
            player_cruiser
        end
    end

    def player_submarine
        puts "Enter the squares for ye Submarine (2 spaces):"
        input = gets.chomp
        if @player_board.valid_placement?(@player_submarine, input.split)
            @player_board.place(@player_submarine, input.split)
            puts @player_board.render(true)
        else
            puts "Ye can't park here! Try again, scallywag!"
            player_submarine
        end
    end

    def player_rubber_duckie
        puts "Enter the squares for ye rubber duckie (1 space):"
        input = gets.chomp
        if @player_board.valid_placement?(@player_rubber_duckie, input.split)
            @player_board.place(@player_rubber_duckie, input.split)
        else
            puts "Ye can't park here! Try again, scallywag!"
            player_rubber_duckie
        end
    end

    # def turn
    #     boards_render
    # end

    def boards_render
        puts "=============COMPUTER BOARD============= \n" +
        "#{@computer_board.render}" +
        "==============PLAYER BOARD============== \n" +
        "#{@player_board.render(true)}"
    end

    def game_play
        until all_ships_sunk?(@player_board) || all_ships_sunk?(@computer_board)
            player_turn
            computer_turn
            boards_render
        end
    end

    def player_turn
        puts "Enter the coordinate for ye cannonball:"
        input = gets.chomp.to_s
        if @computer_board.valid_coordinate?(input) && !@computer_board.cells[input].fired_upon?
            @computer_board.cells[input].fire_upon
            player_hit_or_miss(input)
        else
            "Please enter a valid coordinate"
            player_turn
        end
    end

    def player_hit_or_miss(input)
        if @computer_board.cells[input].ship
            puts "Your shot on #{input} was a hit."
        else
            puts "Your shot on #{input} was a miss."
        end
    end

    def computer_hit_or_miss(computer_input)
        if @player_board.cells[computer_input].ship
            puts "My shot on #{computer_input} was a hit."
        else
            puts "My shot on #{computer_input} was a miss."
        end
    end    

    def computer_turn
        computer_input = all_coordinates.sample
        if !@player_board.cells[computer_input].fired_upon?
            @player_board.cells[computer_input].fire_upon
            computer_hit_or_miss(computer_input)
        else
            computer_turn
        end
    end

    def all_ships_sunk?(user_board)
        ships = []    
       
        user_board.cells.values.each do |cell|
            ship = cell.ship
            if ship && !ships.include?(ship)
                ships << ship
            end
        end

        ships.all? do |ship|
            ship.sunk?
        end
    end
end