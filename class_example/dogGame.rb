require_relative 'dog_human_classes.rb'

#write a program that uses classes
h = Human.new("Jack")

def getWeight
	return rand(40) + 15
end

breeds = ["Shepperd","Lab", "Pitbul", "Shitzu"]
color = ["White", "Black", "green"]

dogs = []
10.times do
dogs <<  Dog.new(breeds.sample,color.sample,getWeight)
end

dogs.each do |dog|
	dog.run
end

10.times do
h.feedDog(dogs.sample)
end 

dogs.each do |dog|
	puts dog.loyalty
end	

puts "Would you like to feed a dog? If so, enter a number of a dog, and I will feed it"

num = gets.to_i
h.feedDog(dogs[num])
puts dogs.inspect
