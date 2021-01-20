class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        self.all.find{|startup| startup.founder == name}
    end

    def self.domains
        self.all.map {|startup|startup.domain}
    end

    def sign_contract(venture_capitalist, type, amount_invested)
        FundingRound.new(self, venture_capitalist, type, amount_invested)
    end

    def get_sum
        FundingRound.all.select do |contract|
           if contract.startup == self
            contract.startup
           end
        end
    end

    def num_funding_rounds
        self.get_sum.count
    end

    def total_funds
        get_sum.map do |startup|
            startup.investment
        end.sum
    end

    def investors
        get_sum.map do |startup|
            startup.venture_capitalist
        end.uniq
    end


end
