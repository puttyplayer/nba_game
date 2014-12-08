require_relative 'sports_classes.rb'

system 'clear'
puts "Welcome to David Bromberg BBall Live"
puts "Today we will be creating your player, and your coach."


choice1 = rand(6)
teams = ["hornets", "knicks", "heat","nets","cavs", "spurs"]
team1 = teams[choice1]
names = ["David Bromberg","Carmelo Anthony","Kevin Durant","Lebron James","Kobe Brynat","Kevin Love"]
heights = [112,90,80,70,75,80]
weights = [200,129,99,220,220,225]
roster = [1,]

#creates other teammates
4.times do
roster <<  Player.new(names.sample,heights.sample,weights.sample,team1)
end

#puts the team mates
puts "Here are your team mates"
roster.each_with_index do |x,i|
                puts x.name if i > 0
        end


#****************************************
#now we ask for the name of the player	
		
			#get the player info
puts "Now we are going to create your player. Write the name of the player"
	name1 = gets.chomp
puts "write the height of the player(inches)"
	height1 = gets.to_i
puts "write the weight of the player (pounds)"
	weight1 = gets.to_i
#create the player
player1 = Player.new(name1,height1,weight1,team1)
puts player1.inspect
roster[0]= player1
puts "Congradulations! You are now a member of the #{team1}!"

#create a coach
puts "Enter the name of your coach"
	name2 = gets
coach1 = Manager.new(name2,team1)
	puts "Congradulations! You are now a coach of the #{team1}"
#************************************************
roster.each_with_index do |x,i|
	$time =  x.playingtime if i == 0
	$happy = x.happy if i == 0
end
system 'clear'
#*************************************
#$newPlayer = "stay"
def select(a,r)
puts "Coach #{a}, here are your players. \n To select a player write the number next to their name."
	r.each_with_index do |x,i|
                puts "#{i+1} #{x.name}" if i >= 0
	end
choice = gets.to_i
$play_again == "yes"
case choice
	when 1
		$playerChoice=r[0]
	when 2
		$playerChoice=r[1]
	when 3
		$playerChoice=r[2]
	when 4
		$playerChoice=r[3]
	when 5
		$playerChoice=r[4]
		
end
puts $playerChoice.inspect
#********************************** 
end
def game(a)
while $playerChoice.stayIn == "yes"
	puts "Coach #{a},  To bench #{$playerChoice.name}, write 'bench', to play #{$playerChoice.name} write 'play'."
	lineup = gets.chomp

	if lineup  == "bench"
		$playerChoice.getbenched
	elsif lineup == "play"
		$playerChoice.gametime
	else
		puts "Invalid input"

	end

	$playerChoice.getStat
end
end
select(name2,roster)
game(name2)
system 'clear'
$play_again = "yes"
#*************************
def win
	if $playerChoice.happy == 10
		puts "You win!!!!!"
		puts "#{$playerChoice.name} has acheived a happiness of 10. If you are happy then you are a winner. Want to keep playing with another player? If so, write 'yes'. If not, write 'no'"
		choice3 = gets.chomp
		if choice3 == "yes"
			$play_again == "yes"
		else
			$play_again == "no"
		end
	end
end
#**********************************
def difPlayer(a,b)
	puts "Would you like to play with a different player? If so write 'yes'"
		keepPlaying = gets.chomp
	i = 2
	while $play_again == "yes"	
		if keepPlaying == "yes"
			puts "When selecting your next player, remember to choose a differnt player, or your game will end for cheating"
			select(a,b)
			game(a)
			system 'clear'
			puts "Want to stop playing? If so write 'yes'. To keep playing write 'no'"
			stop = gets.chomp
				if stop == "yes"
					$play_again = "no"
				end
				
				if i == 5
					$play_again = "no"
					break
				end
			else
				$play_again = "no"
				break
	
			end		
		i = i +1
		puts "******************************"
		puts "This is try number #{i}. The goal of the game is to get a hapiness of 10. You get this by making shots"
		puts "******************************"
	end
end
difPlayer(name2,roster)
puts "Game Over. Hope you enjoyed David Bromberg BBALL live" 
