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

    def offer_contract(startup, type, amount_invested)
        FundingRound.new(startup, self, type, amount_invested)
    end

    def get_sum
        FundingRound.all.select do |contract|
           if contract.venture_capitalist == self
            contract
           end
        end
    end

    def funding_rounds
        get_sum
    end

    def portfoloio
        funding_rounds.map {|contract| contract.startup}.uniq
    end

    def bigges_investment
        big_invester = funding_rounds.max do |a_investment, b_investment|
            a_investment.investment <=> b_investment.investment
        end
        big_invester
    end
    
    def get_all_by_domain(domain)
        funding_rounds.select{|contract| contract.startup
            if contract.startup.domain == domain
            contract
            end
        }
    end    

    def invested(domain)
        get_all_by_domain(domain).map {|contract| contract.investment}.sum
    end
end
