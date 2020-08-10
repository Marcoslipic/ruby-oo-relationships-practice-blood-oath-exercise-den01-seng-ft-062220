# require 'require_relative'
require_relative '../config/environment.rb'
# require 'pry'



def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry

ben = Follower.new "Ben", 19, "Lets get wet"
jeff = Follower.new "Jeff", 28, "Lets get dry actually"
keith = Follower.new "Keith", 98, "Im not allowed to be wet"
lamar = Follower.new "Lamar", 31, "I have become wet, by no fault of my own"
lisa = Follower.new "lisa", 10, "Saxophone noises"


cult1 = Cult.new "Pool", "Houston", 1980, "wet"
cult2 = Cult.new "Space Cult", "Luxembourg", 1810, "yes"
cult3 = Cult.new "SoulCycle", "New York", 2010, "weee"
cult4 = Cult.new "Eeeeee", "New York", 2011, "cool stuff folks"

ben.join_cult cult1, 8-20-19
lamar.join_cult cult1, 3-4-17
lamar.join_cult cult2, 2-1-14


# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits