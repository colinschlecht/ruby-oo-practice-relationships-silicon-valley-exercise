require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup2 = Startup.new("Facebook", "Mark", "www.facebook.com")
startup1 = Startup.new("Myspace", "Tom", "www.myspace.com")
startup3 = Startup.new("Boundless Immigration", "Sagar", "www.BI.com")

vc1 = VentureCapitalist.new("Colin", 1)
vc5 = VentureCapitalist.new("2", 1)
vc2 = VentureCapitalist.new("Peypey", 2)
vc3 = VentureCapitalist.new("George", 10000000000)
vc4 = VentureCapitalist.new("Carl", 100000000000)

fr1 = FundingRound.new(startup1,vc1, "Angel", 10)
fr2 = FundingRound.new(startup2,vc2, "Angel", 10)
fr3 = FundingRound.new(startup1,vc2, "Angel", 10)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line