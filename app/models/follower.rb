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
    
end