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
        if @ship != nil
            @ship.hit
        else
            @render = "M"
        end
    end

    def render(my_board = false)
        @render

         if my_board == true #&& @ship != nil
            @render = "S" 
         else
            @render = "."
         end
    end
end