class Board
    attr_reader :cells

    def initialize
        @cells = {
        "A1" => Cell.new("A1"),
        "A2" => Cell.new("A2"),
        "A3" => Cell.new("A3"),
        "A4" => Cell.new("A4"),
        "B1" => Cell.new("B1"),
        "B2" => Cell.new("B2"),
        "B3" => Cell.new("B3"),
        "B4" => Cell.new("B4"),
        "C1" => Cell.new("C1"),
        "C2" => Cell.new("C2"),
        "C3" => Cell.new("C3"),
        "C4" => Cell.new("C4"),
        "D1" => Cell.new("D1"),
        "D2" => Cell.new("D2"),
        "D3" => Cell.new("D3"),
        "D4" => Cell.new("D4")
        }
    end

    def valid_coordinate?(cell)
        @cells.include?(cell)
    end

    def validate_coordinates(coordinates)
        coordinates.all? do |coordinate|
            valid_coordinate?(coordinate)
        end
    end

    def valid_placement?(ship, coordinates)
        return false unless validate_coordinates(coordinates)
        return false unless available?(ship, coordinates)
       
        letter_coord = []
        number_coord = []
        valid_arrays = []

        coordinates.each do |coordinate|
            letter_coord << coordinate[0]
            number_coord << coordinate[1].to_i
        end
        
        if letter_coord.all?(letter_coord[0])
            (1..4).each_cons(ship.length) { |sub_array| valid_arrays << sub_array }
            valid_arrays.include?(number_coord) && coordinates.length == ship.length
            
        elsif number_coord.all?(number_coord[1])
            ("A".."D").each_cons(ship.length) { |sub_array| valid_arrays << sub_array } 
            valid_arrays.include?(letter_coord) && coordinates.length == ship.length

        end
    end

    def available?(ship, coordinates)
        coordinates.all? do |coordinate|
            cells[coordinate].empty?
        end   
    end

    def place(ship, coordinates)
        coordinates.each do |coordinate|
            cells[coordinate].place_ship(ship)
        end       
    end

    def render(player_board = false)

        if player_board == false
            board  = "  1 2 3 4 \n" +
                "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render}\n" +
                "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render}\n" +
                "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render}\n" +
                "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}\n"
        else
            board  = "  1 2 3 4 \n" +
                "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)}\n" +
                "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)}\n" +
                "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)}\n" +
                "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)}\n"
        end
    end
end