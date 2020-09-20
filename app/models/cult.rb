class Cult
    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize name, location, founding_year, slogan
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower follower
        Bloodoath.new(self, follower, 2007)
    end

    def cult_population
        cult_membership = Bloodoath.all.select do |oath| 
            oath.cult == self
        end
        cult_membership.length
    end

    def self.find_by_name name
        all.find do |cult|
            cult.name == name
        end
    end

    def self.find_by_location location
        all.select do |cult|
            cult.location == location
        end
    end

    def self.find_by_founding_year year
        all.select do |cult|
            cult.founding_year == year
        end
    end

    def all_oaths
        Bloodoath.all.select {|oath| oath.cult == self}
    end

    def average_age 
        cults_oaths = self.all_oaths
        followers_ages = cults_oaths.map {|oath| oath.follower}.map(&:age) #{|follower| follower.age}
        sum_ages = followers_ages.reduce(0) do |sum, age|
            sum + age.to_f
        end / self.cult_population
    end

    def followers_mottos
        cults_oaths = self.all_oaths
        followers = cults_oaths.map {|oath| oath.follower}
        followers.map {|follower| follower.life_motto}
    end

end