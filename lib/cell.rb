class Cell
    attr_reader :coordinate, :ship, :render

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
        if @ship != nil
            @ship.hit
        end
    end

    
end