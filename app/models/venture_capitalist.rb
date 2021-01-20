class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.how_many_pancakes
        @@all
    end

    def self.tres_commas_club
        self.how_many_pancakes.select {|capitalist|
          if capitalist.total_worth > 1000000000
            capitalist
          end
        }
    end
end
