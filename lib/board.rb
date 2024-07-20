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

    def valid_placement?(ship, coordinates)
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

    def place(ship, coordinates)

    end


end