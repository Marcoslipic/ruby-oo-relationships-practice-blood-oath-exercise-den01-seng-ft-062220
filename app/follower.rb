

class Follower
    attr_reader :name, :age, :life_motto

    @@all = []
    
    def initialize name, age, life_motto
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end
    
    def self.all
        @@all
    end

    def cults
        blood_oaths = Bloodoath.all.select {|oath| oath.follower == self}
        blood_oaths.map(&:cult)
    end

    def join_cult name, initiation_date
        Bloodoath.new(name, self, initiation_date)
    end

    def self.of_a_certain_age age
        all.select {|follower| follower.age >= age}
    end

    def fellow_cult_members
        all_oaths = Bloodoath.all.select {|oath| oath.follower == self}
        all_cults = all_oaths.map do 
            |oath| oath.cult 
        end
        all_cults.map {|cult| cult.all_followers}
    end


end