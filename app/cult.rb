

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

    def self.find_by_name name
        all.find {|cult| cult.name == name}
    end

    def self.find_by_location location
        all.select {|cult| cult.location == location}
    end

    def cult_population
        Bloodoath.all.select do |bloodoath|
            bloodoath.cult == self
        end.count
    end

    def self.find_by_founding_year year
        all.select {|cult| cult.founding_year == year}
    end

    def recruit_follower follower, initialion_date
        Bloodoath.new(self, follower, initialion_date)
    end

    def all_followers
        Bloodoath.all.select {|oath| oath.cult == self}.map(&:follower)
    end


end