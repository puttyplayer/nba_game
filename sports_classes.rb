class Player
        def initialize(name,height,weight,team)
	@name = name
	@team = team
	@weight = weight
	@height = height
	@happy = 7
	@playingtime = 5
	@respect = 6
	@stayIn = "yes"
	@beBenched = "no"
	end
	
	def beBenched
		@beBenched
	end

	def stayIn
		@stayIn
	end

	def happy
		return @happy
	end

	def team
		@team
	end

	def weight
		@weight
	end
	
	def height
		@height
	end
	
	def name
		@name
	end
	
	def happy
		@happy
	end

	def playingtime
		@playingtime
	end	

	def getbenched
		@playingtime -= 1 if @playingtime > 0
		@happy -= 1 if @happy > 0
		@stayIn = "no"
		puts "Sorry, but the coach wanted to bench you"
	end
	
	def getStat
		puts "********************"
		puts "#{@name}, Here are your stats:"
		sleep(0.25)
		puts "Your hapiness level is #{@happy}"
		sleep(0.25)
		puts "You played for #{@playingtime} minutes"
		sleep(0.25)
		puts "Your respect levels are #{@respect}"
	end

	def shoot
		make = rand(2)
		if make == 1 then
			puts "Nice Shot!"
			@happy += 1 if @happy <=  10
			@playingtime += 5
			@stayIn = "yes"
		else
			puts "You missed your shoot. You suck, the coach is benching you!"
			@happy -= 1 if @happy > 0
			@playingtime -= 1 if @playingtime > 0
			@stayIn = "no"
		end
	end

	def pass
		make = rand(10)
                if make == 1 then
                        puts "Come on! You passed to the other team. The coach is benching you"
                        @happy -= 1 if @happy > 0
                        @playingtime -= 5 if @playingtime > 0
			@stayIn = "no"
                else
                        puts "Nice Pass! The guys on the team are starting to respect you"
                        @happy += 1 if @happy <= 10
                        @playingtime += 3 if @playingtime > 0
			@stayIn = "yes"
		end

	end

	def dunk
                if @height > 70
                        puts "Nice Dunk! You slamed the ball into the net!"
                        @happy += 1 if @happy <=  10
                        @playingtime += 5
                        @stayIn = "yes"
                else
                         puts "You can't dunk because your short! Why would you even attempt to dunk in a NBA game."
			@happy -= 1 if @happy > 0
                        @playingtime -= 5 if @playingtime > 0
                        @stayIn = "no"    
		end
	end
	
  	def win
        	if @happy  == 10
                	system 'clear'
			puts "You win!!!!!"
                	puts "#{@name} has acheived a happiness of 10. If you are happy then you are a winner. Want to keep playing with #{@name}? \n If so, write 'yes'. If not, write 'no'"
                		choice3 = gets.chomp
                	if choice3 == "yes"
                        	$play_again == "yes"
                	else
                        	$play_again == "no"
				@stayIn = "no"
                	end
                end
        end

	def gametime
		puts "Welcome to the big game, #{@name}. You will be playing #{@playingtime} minutes.  Your options are to shoot,dunk or to pass"
		choice = gets.chomp
		if @happy <= 0
			puts "I won't play"
		end

		if @playingtime < 5
			@happy -= 1 if @happy > 0
			@weight += 3
		elsif @playingtime > 5
			@happy += 1 if @happy <= 10
			@weight -= 2
		end

		if choice == "shoot"
			shoot
			win
		elsif choice == "pass"
			pass
			win
		elsif choice == "dunk"
			dunk
			win
		else
			puts "invalid input"
		end
			
	end



	def compliment
		@happy +=1
		@playingtime +=10
		@respect +=1
	end
		
end 

class Manager
	def initialize(name, team)
	@name = name
	@team = team
	@happy = 9
	@respect = 10
	end

	def name
		@name
	end

	def team
		@team
	end
	
	def happy
		@happy
	end

	def respect
		@respect 
	end

	def bench(player)
		player.getbenched
	end

	def hifive(player)
		player.compliment
	end
	
	def play(player)
		player.gametime
	end	
	
	def gameday
	puts "Coach #{@name}, Ready for the big game? Who do you want to play? You can bench a player, or choose to play a player. Type the name of the player you want to play"
	
	player = gets
	
	puts "Good job. To bench this player write bench, to play this player write play"
	lineup = gets.chomp
	puts player	
	if lineup  == "bench"
		member.bench
	elsif lineup == "play"
		member.gametime
	else
		puts "Invalid input"

	end
	end

end
