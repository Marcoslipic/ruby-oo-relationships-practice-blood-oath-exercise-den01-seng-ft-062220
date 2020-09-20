class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize follower_name, age, life_motto
        @name = follower_name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def cults
        followers_oaths = Bloodoath.all.select do |oath|
            oath.follower == self
        end
        followers_oaths.map {|oath| oath.cult}
    end

    def join_cult cult, date
        Bloodoath.new(cult, self, date)
    end

    def self.of_a_certain_age age
        all.select do |follower|
            follower.age >= age
        end
    end
    
end