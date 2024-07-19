class Cell
    attr_reader :coordinate, :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
        @render = "."
    end

    def empty?
        @ship == nil
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon?
        @fired_upon
    end

    def fire_upon
        @fired_upon = true
        if @ship
            @ship.hit
        end
    end

    def render(player_board = false)
        if @ship && @ship.sunk?
            "X"
        elsif @fired_upon && @ship
            "H"
        elsif @fired_upon
            "M"
        elsif player_board && @ship
            "S"
        else
            "."
        end
    end
end