#two class deffinitions

class Human
	def initialize(name)
		@name = name
		@happiness = 7
	end

	def happiness
		return @happiness
	end

	def name
		return @name
	end

	def feedDog(dog)
		#call an asociated method in dog class
		dog.eat
	end	
	
	def petDog(dog)
		@happiness +=1
	end
	
	def getBit
		@happiness -=1
	end

	def neglectDog(dog)
		dog.loseLoyalty
	end				
end

class Dog
	def initialize(breed,color,weight)
		@breed = breed
		@color = color
		@weight = weight
		@tiredness = 2
		@loyalty = 0
		@health = 8
	end

	def loyalty
		@loyalty
	end

	def tiredness
		@tiredness
	end

	def health
		@health
	end

	def bark                                                                               
		puts "Woof! Arf!"
	end

	def breed
		return @breed
	end

	def color
		@color #can use return or not
	end

	def weight
		return @weight
	end

	def run
		if @tiredness == 10
			puts "Sorry, to tired to run"
		else
			@tiredness += 1
		end
	end

	def rest(time)
		@tiredness -= time
		if @tiredness < 0
			@tiredness = 0
		end
	end

	def bite(human)
		if @loyalty < 5
			human.getBit
		end
	end
	
	def eat
		@weight +=2
		@health +=1 if @health < 10
		@loyalty +=1 if @loyalty < 10
	end
	
	def loseLoyalty
		@loyalty -=1
	end

end
