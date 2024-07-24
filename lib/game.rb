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
        boards_render
        game_play
        winner
        welcome 
        play_or_quit
    end

    def welcome
        puts "\n\nWelcome to BATTLESHIP\n" +
        "Enter p to play...if ye dare!!\n" + 
        "Enter q to retreat like the scoundrel you are!!!\n"
    end

    def play_or_quit
        input = gets.chomp.downcase
        
        if input == "p"
            computer_placement
        elsif input == "q"
            exit
        else
            puts "Yarrr! I SAID, ENTER 'p' or 'q'!!!!"
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
        puts "\nAhoy Scallywag! I have laid out me fleet on the grid.\n\n" +
        "Ye now need to lay out yer three ships.\n\n" +
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
        input = gets.chomp.upcase.delete(",")
        if @player_board.valid_placement?(@player_cruiser, input.split)
            @player_board.place(@player_cruiser, input.split)
            puts @player_board.render(true)
        else
            puts "Ye can't park here! Try again, scallywag!"
            player_cruiser
        end
    end

    def player_submarine
        puts "\nEnter the squares for ye Submarine (2 spaces):"
        input = gets.chomp.upcase.delete(",")
        if @player_board.valid_placement?(@player_submarine, input.split)
            @player_board.place(@player_submarine, input.split)
            puts @player_board.render(true) 
        else
            puts "\nYe can't park here! Try again, scallywag!"
            player_submarine
        end
    end

    def player_rubber_duckie
        puts "\nEnter the squares for ye rubber duckie (1 space):"
        input = gets.chomp.upcase.delete(",")
        if @player_board.valid_placement?(@player_rubber_duckie, input.split)
            @player_board.place(@player_rubber_duckie, input.split)
        else
            puts "\nYe can't park here! Try again, scallywag!"
            player_rubber_duckie
        end
    end

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

    def winner
        if all_ships_sunk?(@player_board)
            puts "\nI sent ye to Davy Jones' Locker!!\n" +
            "Better you stick with finger paints!"
        else
            puts "\nYou won...Ye were lucky.\n" +
            "Until next time, sailor!"
        end
    end

    def player_turn
        puts "\nEnter the coordinate for ye cannonball: \n"
        input = gets.chomp.upcase
        if @computer_board.valid_coordinate?(input) && @computer_board.cells[input].fired_upon?
            puts "Adjust your eyepatch!!\n" +
            "You already shot there, scallyway!"
            player_turn
        elsif @computer_board.valid_coordinate?(input) && !@computer_board.cells[input].fired_upon?
            @computer_board.cells[input].fire_upon
            player_hit_or_miss(input)
        else
            puts "\nWrong ocean! Enter a valid coordinate!! \n"
            player_turn
        end
    end

    def player_hit_or_miss(input)
        if @computer_board.cells[input].ship
            puts "\nYour shot on #{input} struck true.\n"

            if @computer_board.cells[input].ship.sunk?
                puts "Ye scurvy dog!!! You sunk my #{@computer_board.cells[input].ship.name}!"
            end
        else
            puts "\nYour shot on #{input} was a miss.\n" +
            "#{insults}\n"
        end
    end

    def insults
        insults = ["Ye flea-bitten scoundrel!", "Arr, ye lily-livered landlubber!", "Ye mangy sea bass!",
        "Ye cowardly swab!", "Ye barnacle-brained scallywag!", "Ye flea-bitten scoundrel!", 
        "I am sick when I do look on thee!",  "More of your conversation would infect my brain.", 
        "The tartness of your face sours ripe grapes.", "Thine face is not worth sunburning.", "Thou cream faced loon", 
        "Thy sin's not accidental, but a trade.", "Your brain is as dry as the remainder biscuit after voyage.", 
        "You bilge rat! You rampallian! I'll tickle your catastrophe!"]
        return insults.sample 
    end

    def computer_hit_or_miss(computer_input)
        if @player_board.cells[computer_input].ship
            puts "My shot on #{computer_input} was a hit.\n" +
            "Shiver me timbers!"
            if @player_board.cells[computer_input].ship.sunk?
                puts "I sunk your #{@player_board.cells[computer_input].ship.name}!\n" +
                "#{insults}"
            end
        else
            puts "My shot on #{computer_input} was a miss. Drat!\n"
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