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
        x = []
        y = []
        z = []
        coordinates.each do |coordinate|
            x << coordinate[0]
            y << coordinate[1].to_i
        end
        
       if x.all?(x[0])
        (1..4).each_cons(ship.length) { |i| z << i }
        z.include?(y) && coordinates.length == ship.length
       elsif y.all?(y[1])
        ("A".."D").each_cons(ship.length) { |i| z << i } 
        z.include?(x) && coordinates.length == ship.length
       end
        # (1..4).each_cons()
        
        # break string into coordinate pair
        # coordinate letters must stay the same
        # coordinate nums must be increase by 1
        # OR
        #coordinate letters increase by 1
        #coordinate nums stay the same
        #
    end


end